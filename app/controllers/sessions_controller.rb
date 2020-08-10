class SessionsController < ApplicationController
  skip_before_action :authorize_and_update, only: [:new, :create]
  before_action :redirect_to_notes, only: [:new, :create]

  def new
  end

  def create
    respond_to do |format|
      @user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
      if @user
        @user.update_attribute(:active_at, Time.now.to_i)
        session[:user_id] = @user[:_id].to_s
        format.html { redirect_to notes_path }
      else
        format.html { redirect_to sessions_path, notice: "Invalid credentials. Please check your username and password and try again" }
      end
    end
  end

  def welcome
  end

  def destroy
    reset_session
    @user.update_attribute(:active_at, 0)
    redirect_to '/'
  end

  private

  def user_params
    params.require(:login).permit(:username, :password, :email)
  end
end
