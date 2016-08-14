class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :recent_projects
  def recent_projects
    @recent_project = Project.all.first
    @current_projects = Project.where(is_ongoing: true).limit(6)
    @past_projects = Project.where(is_ongoing: false).limit(10)
  end
end
