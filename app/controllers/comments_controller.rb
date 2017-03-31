class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.job_id = params[:job_id]
    comment.save

    redirect_to job_path(params[:job_id])
  end

  def destroy
    Comment.find(params[:id]).destroy

    redirect_to job_path(params[:job_id])
  end

  def edit
    @comment = Comment.find(params[:id])
    @job = @comment.job
  end

  def update
    Comment.update(params[:id], comment_params)

    redirect_to job_path(params[:job_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
