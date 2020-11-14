class TestsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  def index
  end
  
  def start
  end
  
  def show
  end
  
  private
  
  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
