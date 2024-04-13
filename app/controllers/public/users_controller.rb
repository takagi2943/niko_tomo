class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_not_guest_user, only: [:destroy]

  def show
    # @music_post = Music_post.new
    @user = User.find(params[:id])
    @music_posts = @user.music_posts
    @favorite_niko = @user.nikos.where(is_favorite: true).first
  end

  def edit
    @user = User.find(params[:id])
    @niko = Niko.new
    # @niko = Niko.new

    # @niko_tree_type = Niko.new
  end

  def comfirm
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private

  def niko_tree_type_parame
    params.require(:niko_tree_type).permit(:tree_type)
  end

  # ゲストログイン縛りの設定
  def ensure_not_guest_user
    if current_user.guest_user?
      flash[:error] = "ゲストユーザーはこの操作を実行できません。"
      redirect_to edit_user_path(current_user)
    end
  end
end
