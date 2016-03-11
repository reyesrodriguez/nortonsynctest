class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
 
  def user_name
    @username = User.find(session[:user_id]).name 
  end
  def current_user
  	@current_user ||= User.find(session[:user_id])if session[:user_id]
  	rescue ActiveRecord::RecordNotFound
  end

  def require_user
  	redirect_to "/log-in" unless current_user
  end

  helper_method :current_user
end
