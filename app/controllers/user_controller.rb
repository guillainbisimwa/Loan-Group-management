class UserController < ApplicationController
  # before_action :authenticate_user!

  def new; end

  def index
    # redirect_to user_path if logged_in?
  end

  def create
    flash[:notice] = 'Welcome to our app'
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
