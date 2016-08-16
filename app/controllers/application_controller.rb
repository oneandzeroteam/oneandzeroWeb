class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :recent_projects
  def recent_projects
    @recent_project = Project.all.first
    @current_projects = Project.where(is_ongoing: true).limit(6)
    @past_projects = Project.where(is_ongoing: false).limit(10)
		@boards = Board.all
  end

  after_filter :store_action
  def store_action
	  return unless request.get?
	  if (request.path != "/users/sign_in" &&
		  request.path != "/users/sign_up" &&
		  request.path != "/users/sign_out" &&
		  request.path != "/users/password/new" &&
		  request.path != "/users/password/edit" &&
		  request.path != "/users/confirmation" &&
		  !request.xhr?) # don't store ajax calls

		  store_location_for(:user, request.fullpath)
	  end
  end
end
