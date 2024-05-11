class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]
   before_action :ensure_not_guest_user, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @music_posts = @user.music_posts
    @new_music_post = MusicPost.new
    @favorite_niko = @user.nikos.where(is_favorite: true).first
  end

  # user検索用
  def index
    if params[:search]
      @users = User.where('nickname LIKE ?', "%#{params[:search]}%")
    else
      @users = User.all
    end

  end

  def edit
    @user = User.find(params[:id])
    @niko = Niko.new
  end

  def create
    @user = @user.new(user_params)
    @user = User.all
    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to :user_registration_path, alert: '入力を確認してください。'
    end
  end

  def confirm
     @user = User.find(params[:id]) # または適切な方法でユーザーを取得
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: '更新されました。'
    else
      # 二胡の情報も新しく持ってくるように
      # if分岐にないにないのでfindは必要ない
      @niko = Niko.new
      render :edit
    end
  end
  
  # 退会確認用
  def withdraw
    @user = current_user
    @user.is_active = false
    @user.save
    sign_out
    redirect_to root_path, notice: "二胡友を退会しました。"
  end

  # フォロー
  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end
  # フォロワー
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end
  # いいね
  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:music_post_id)
    @favorite_music_posts = MusicPost.find(favorites)
  end

  private

  def niko_tree_type_parame
    params.require(:niko_tree_type).permit(:tree_type)
  end

  # ゲストログイン縛りの設定
  def ensure_not_guest_user
    if current_user.guest_user?
      flash[:alert] = "ゲストユーザーはこの操作を実行できません。"
      redirect_to edit_user_path(current_user)
    end
  end

  # ユーザー自身のプロフィール以外のページにアクセスしようとした場合にはアクセスを拒否
  def correct_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to(root_path, alert: "不正なアクセスです")
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :introduction, :profile_image, :email)
  end
end
