class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    @user_page = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @music_posts = @user.music_posts
  end

  def edit
    @user = User.find(params[:id])
    @niko = @user.nikos.find_by(id: params[:niko_id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user), notice: "You have updated user successfully."
    else
    render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.update(introduction: nil)
    end
    redirect_to admin_user_path(@user)
  end
  
  def comment
    @labos = Labo.all
    @music_posts = MusicPost.all
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image)
  end

end
