class QuestionsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
  end

  def show
  end
  
  def destroy
    render plain: 'Удаление вопроса Y'
  end
  
  private
  
  def rescue_with_question_not_found
    render plain: 'Test was not found!'
  end
end
