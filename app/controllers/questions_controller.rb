class QuestionsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @test = Test.find(params[:test_id])
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end
  
  def destroy
    render plain: 'Удаление вопроса Y'
  end
  
  private
  
  def rescue_with_question_not_found
    render plain: 'Questions was not found!'
  end
end
