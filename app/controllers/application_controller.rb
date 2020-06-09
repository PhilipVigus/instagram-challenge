class ApplicationController < ActionController::Base
  helper_method :logged_in_user

  def logged_in_user
    @logged_in_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def restrict_route_access
    redirect_to '/login' unless logged_in_user
  end
end
