class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
