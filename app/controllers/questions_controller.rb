class QuestionsController < ApplicationController
  def index
  end

  def show
  end
  
  def destroy
    render plain: 'Удаление вопроса Y'
  end
end