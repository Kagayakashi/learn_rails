class CategoriesController < ApplicationController
  
  before_action :find_category, only: %i[show edit update destroy]
  
  after_action :send_log_controller_action
  around_action :send_log_execution_time
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  def index
    @categories = Category.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @category.update(caregory_params)
      redirect_to @category
    else
      render 'edit'
    end
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(caregory_params)
    @category.creator = User.first
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
 
    redirect_to tests_path
  end
  
  private
  
  def caregory_params
    params.require(:category).permit(:title, :level)
  end
  
  def find_category
    @category = Category.find(params[:id])
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
    render plain: 'Category was not found!'
  end
end
