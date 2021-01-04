class UserController < ApplicationController
  #before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def create
    flash[:notice] = "Welcome to our app"
  end

  def show
    @user = User.find(params[:id])
  end

  # def login
  # end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
