class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update]
  
def show
  @niko = Niko.all
  @user = User.all
  #@music_post = Music_post.new
  @user = User.find(params[:id]) # ユーザーの情報取得
  @music_posts = @user.music_posts # 音楽共有の投稿を取得
  #@niko = Niko.find(params[:id]) # 登録している二胡の情報を取得
  #if current_user.favorite_instruments.include?(@niko)
    # ログインしているユーザーがお気に入りの楽器を持っている場合、楽器の情報を表示
    # ここで@nikoを表示するコードを記述する
  #else
    # ログインしているユーザーがお気に入りの楽器を持っていない場合、何も表示しないか、別の処理を行う
    # 例えば何も表示しない場合は何も記述せず、別の処理を行う場合はその処理を記述する
  #end
end

  def edit
    @nikos = Niko.find(params[:id])
  end

  def comfirm
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_user_path(@user), notice: "ユーザー情報変更登録しました。"
    else
      render "edit"
    end
  end
end
