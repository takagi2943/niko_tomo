class Admin::GroupsController < ApplicationController
 before_action :authenticate_admin!

  def index
   @groups = Group.all
   @group_page = Group.page(params[:page])
  end

  def show
   @group = Group.find(params[:id])
   @users = @group.users
   @user = @group.user
  end

  def destroy
   @group = Group.find_by(id: params[:id])
   redirect_to admin_groups_path
  end
end
