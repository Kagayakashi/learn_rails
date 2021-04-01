class Admin::CategoriesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_category, only: %i[show edit update destroy]

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
      redirect_to admin_category_path(@category)
    else
      render 'edit'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(caregory_params)
    if @category.save
      redirect_to admin_category_path(@category)
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def caregory_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Category was not found!'
  end
end
