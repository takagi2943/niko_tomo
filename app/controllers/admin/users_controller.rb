class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search]
      @users = User.where('nickname LIKE ?', "%#{params[:search]}%")
      @user_page = User.page(params[:page])
    else
      @users = User.all
      @user_page = User.page(params[:page])
    end
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "You have updated user successfully."
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
    params.require(:user).permit(:nickname, :is_active, :introduction, :profile_image)
  end

end
