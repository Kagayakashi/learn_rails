class TestsController < ApplicationController
  
  before_action :find_test, only: %i[show edit update, destroy]
  after_action :send_log_controller_action
  around_action :send_log_execution_time
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  def index
    @tests = Test.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render 'edit'
    end
  end
  
  def new
    @test = Test.new
  end
  
  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def destroy
    redirect_to @test
  end
  
  private
  
  def test_params
    params.require(:test).permit(:title, :level)
  end
  
  def find_test
    @test = Test.find(params[:id])
  end
  
  def send_log_controller_action
    logger.info("[#{controller_name}] [#{action_name}] was executed!")
  end
  
  def send_log_execution_time
    start = Time.now
    yield
    finish = Time.now - start
    
    logger.info("Execution time: #{finish * 1000}ms")
  end
  
  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
