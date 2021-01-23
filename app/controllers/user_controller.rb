class UserController < ApplicationController
  before_action :require_user

  def show; end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
