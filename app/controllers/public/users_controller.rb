class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @niko = Niko.all
    @user = User.all
    # @music_post = Music_post.new
    @user = User.find(params[:id])
    @music_posts = @user.music_posts

  end

  def edit
    @nikos = Niko.find(params[:id])
    @niko_tree_type = Niko.new
  end

  def comfirm
  end

  def create
    @niko_tree_type = Niko.new(niko_tree_type_parame)
    @niko_tree_type.save
    redirect_to user_user_path
  end

  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user), notice: "ユーザー情報変更登録しました。"
    else
      render "edit"
    end
  end

  private

  def niko_tree_type_parame
    params.require(:niko_tree_type).permit(:tree_type)
  end
end
