class JobsController < ApplicationController

  before_action :all_categories, only: [:new, :edit]

  def index
    @jobs = Job.all unless params[:sort]
    @jobs = Job.order(:city) if params[:sort] == 'location'
    @jobs = Job.order(level_of_interest: :desc) if params[:sort] == 'interest'
    @jobs = Job.where("city='#{params[:location]}'") if params[:location]
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
    @job.taggings.destroy_all
    params['job']['tag_ids'].each do |tag_id|
      @job.tags << Tag.find(tag_id.to_i) unless tag_id.empty?
    end
    @job.update(job_params)

    redirect_to job_path(@job)
  end

  def destroy
    job = Job.find(params[:id]).destroy

    redirect_to company_path(job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def all_categories
    @categories = Category.all
  end
end
