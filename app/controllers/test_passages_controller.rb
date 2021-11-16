class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @test_passage.accept! params[:answer_ids]

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      RewardService::RewardIssue.issue(user: @test_passage.user, test: @test_passage.test) if @test_passage.all_correct?
      redirect_to result_test_passage_path @test_passage
    else
      render 'show'
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
    @test_passage.user.id = current_user;
  end
end
