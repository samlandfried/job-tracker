class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :update, :edit, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

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

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
