class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, except: :root
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @music_posts = @user.music_posts
    @music_post = Music_post.new
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user), notice: "You have updated user successfully."
    else
    render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
