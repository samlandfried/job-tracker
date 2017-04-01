class JobDashboard

  attr_reader :jobs

  def initialize(jobs)
    @jobs = jobs
  end

  def number_of_jobs_by_level_of_interest
    jobs.order(:level_of_interest).group(:level_of_interest).count
  end
end