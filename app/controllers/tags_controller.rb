class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    Tag.create(tag_params)

    redirect_to tags_path
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
