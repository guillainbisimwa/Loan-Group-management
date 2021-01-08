class GroupsController < ApplicationController
  before_action :require_user

  def new; end

  def index; end

  private

  def group_params
    params.require(:group).permit(:name, :user_id)
  end
end
