class GistsController < ApplicationController
  before_action :find_test_passage, only: %i[create]

  def create
    service = GistService.new(@test_passage.current_question)
    gist = service.create_gist

    flash_options = if service.success?
      current_user.gists.create!(question: @test_passage.current_question, hash_id: gist.id)

      { notice_url: t('.success', gist: view_context.link_to(t('.created'), gist.url,
        class: 'text-light font-weight-bold')) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
