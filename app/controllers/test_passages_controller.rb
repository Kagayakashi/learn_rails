class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept! params[:answer_ids]

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path @test_passage
    else
      render 'show'
    end
  end

  def gist
    gist_service = GistService.new
    gist_service.question = @test_passage.current_question
    gist = gist_service.create_gist

    current_user.gists.create!(question: @test_passage.current_question, url: gist.id)

    flash_options = if gist_service.success?
      { notice_url: t('.success', gist: view_context.link_to(t('.created'), gist.url,
        class: 'text-light font-weight-bold')) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
    @test_passage.user.id = current_user;
  end
end
