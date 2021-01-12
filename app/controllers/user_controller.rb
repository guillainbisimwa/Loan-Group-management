class UserController < ApplicationController
  before_action :require_user

  def new; end

  def index; end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
