require './app/models/job_dashboard'

class DashboardController < ApplicationController
  def index
    @dashboard = JobDashboard.new
  end
end
