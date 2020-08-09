class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :redirect_to_notes

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user[:_id].to_s
        format.html { redirect_to notes_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    fields = params.require(:user).permit(:username, :password, :email)
    fields[:active_at] = Time.new
    fields
  end
end
