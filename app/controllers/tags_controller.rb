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

  def destroy
    Tag.find(params[:id]).destroy

    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)

    redirect_to tag_path(tag)
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
