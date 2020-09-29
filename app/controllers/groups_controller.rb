class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
  end
  

  private

  def group_params
    params.require(:group).permit(:name).merge(user_id:current_user.id)
  end

end
