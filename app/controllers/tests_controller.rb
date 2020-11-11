class TestsController < ApplicationController
  def index
    render plain: 'Список тестов'
  end
  
  def start
    render plain: 'Запуск определенного теста'
  end
end