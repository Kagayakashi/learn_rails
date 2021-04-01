class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
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
      redirect_to admin_test_path(@test)
    else
      render 'new'
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_categories_path
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
