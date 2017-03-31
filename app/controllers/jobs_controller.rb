class JobsController < ApplicationController

  before_action :all_categories, only: [:new, :edit]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @job = Job.find(params[:id])
    @comments = @job.comments
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])

    @job.update(job_params)

    redirect_to job_path(@job)
  end

  def destroy
    job = Job.find(params[:id]).destroy

    redirect_to company_jobs_path(job.company, job)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def all_categories
    @categories = Category.all
  end
end
