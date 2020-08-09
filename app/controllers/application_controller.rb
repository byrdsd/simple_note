class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :redirect_to_notes
  helper_method :log_in
  helper_method :log_out

  def current_user
    User.find_by(id: session[:user_id])
  end

  def active_user?
    return false unless current_user
    current_user[:active_at] >= Time.new.to_i - 900
  end

  def authorized
    redirect_to '/' unless active_user?
  end

  def redirect_to_notes
    redirect_to notes_path if active_user?
  end
end
