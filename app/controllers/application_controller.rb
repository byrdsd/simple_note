class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :redirect_to_welcome

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/' unless logged_in?
  end

  def redirect_to_welcome
    redirect_to welcome_path if logged_in?
  end
end
