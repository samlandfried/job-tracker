class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :update, :edit]

  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)

    redirect_to category_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
