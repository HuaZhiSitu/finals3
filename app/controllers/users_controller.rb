class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Account created successfully!"
    else
      flash.now[:alert] = "There were errors in your submission. Please try again."
      render :new
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to root_path, alert: "User not found."
    else
      @bids = @user.bids.includes(:skin).order(created_at: :desc)
    end
  end

private

def user_params
  params.require(:user).permit(:email, :username, :password)
end
end
