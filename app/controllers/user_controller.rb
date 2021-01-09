class UserController < ApplicationController
  # before_action :authenticate_user!
  before_action :require_user

  def new
    redirect_to home_path if logged_in?
  end

  def index
    redirect_to home_path if logged_in?
  end

  def show
    # @user = User.find(params[:id])

    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
