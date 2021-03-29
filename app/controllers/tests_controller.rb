class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit update destroy start]

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
    @test.creator = current_user
    if @test.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def destroy
    @test.destroy
    redirect_to categories_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
  
  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
