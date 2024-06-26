class Admin::GroupsController < ApplicationController
 before_action :authenticate_admin!

  def index
   @groups = Group.all
   # @groups = current_user.groups.includes(:user)
   @group_page = Group.page(params[:page])
  end

  def show
   @group = Group.find(params[:id])
   @users = @group.users
   @user = @group.user
  end

  def destroy
   @group = Group.find_by(id: params[:id])
   @group.destroy
   redirect_to admin_groups_path, notice: "グループを強制的に削除しました。"
  end
end
