class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    return true if current_user
    flash[:error] = 'You need to be logged in to access this page'
    redirect_to new_sessions_path
  end
end
