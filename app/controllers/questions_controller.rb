class TestsController < ApplicationController
  def index
    render plain: 'Список вопросов теста X'
  end

  def show
    render plain: 'Вопрос Y'
  end
  
  def destroy
    render plain: 'Удаление вопроса Y'
  end
end