class ApplicationController < ActionController::Base
  before_action :authorize_and_update
  helper_method :active_user
  helper_method :logged_in?
  helper_method :redirect_to_notes

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def active_user?
    return false unless current_user
    current_user[:active_at] >= Time.new.to_i - 900
  end

  def authorize_and_update
    redirect_to '/' unless active_user?
    @user.update_attribute(:active_at, Time.new.to_i)
  end

  def redirect_to_notes
    redirect_to notes_path if active_user?
  end
end
