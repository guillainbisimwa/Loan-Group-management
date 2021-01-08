class GroupsController < ApplicationController
  before_action :require_user

  def new
    @group = Group.new
  end

  def index; end

  def show
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to group_path, notice: 'Group was successfully created.'
    
    else
      flash[:alert] = 'Error occurs while saving group'
      redirect_to new_group_url
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
