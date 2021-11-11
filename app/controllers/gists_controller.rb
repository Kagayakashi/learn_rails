class GistsController < ApplicationController
  before_action :find_test_passage, only: %i[create]

  def create
    result = Github::CreateGistService.new(@test_passage.current_question).call

    flash_options = if result.success?
      current_user.gists.create!(question: @test_passage.current_question, hash_id: result.id)

      { notice_url: t('.success', gist: view_context.link_to(t('.created'), result.url,
        class: 'text-light font-weight-bold', target: "_blank")) }
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
