class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    @user = user.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報の編集に成功しました"
      redirect_to admin_user_path(@user)
    else
      flash.now[:alert] = "必要な情報を入力してください"
    render "index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image, :email, :birthdate, :gender, :is_active)
  end
end
