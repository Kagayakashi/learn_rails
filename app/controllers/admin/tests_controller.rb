class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test, except: %i[new create]
  before_action :find_category, only: %i[new create]

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
    @test = @category.tests.new
  end

  def create
    @test = current_user.authored_tests.build(test_params)
    @test.category = @category
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render 'new'
    end
  end

  def destroy
    @category = @test.category;
    @test.destroy
    redirect_to admin_category_path(@category)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
  
  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
