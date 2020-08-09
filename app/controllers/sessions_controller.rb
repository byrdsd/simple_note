class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :redirect_to_welcome, only: [:new, :create] 

  def new
  end

  def create
    respond_to do |format|
      @user = User.find_by(
        username: user_params[:username],
        password: user_params[:password]
      )
      session[:user_id] = @user[:_id].to_s
      format.html { redirect_to welcome_path }
    rescue Mongoid::Errors::DocumentNotFound
      format.html { render :new, notice: "Invalid credentials"  }
    end
  end

  def welcome
  end

  private

  def user_params
    params.require(:login).permit(:username, :password, :email)
  end
end