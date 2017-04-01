class JobDashboard

  attr_reader :jobs, :companies

  def initialize
    @jobs = Job.all
    @companies = Company.all
  end

  def number_of_jobs_by_level_of_interest
    Job.order(:level_of_interest).group(:level_of_interest).count
  end

  def companies_with_most_interest(n = 1)
    company_interest = Job.group(:company_id).average(:level_of_interest)
    company_interest.sort_by do |company_id, avg_interest|
      -avg_interest
    end.first(n).map {|tuple| [Company.find(tuple.first), tuple.last.to_i]}
  end
end