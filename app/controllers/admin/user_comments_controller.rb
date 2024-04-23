class Admin::UserCommentsController < ApplicationController
  before_action :authenticate_admin!

  # 会員の投稿した一覧取得
  def comment
    # @labo = Labo.find(params[:id])
    # @music_post = MusicPost.find(params[:id])
    @user = User.find(params[:user_id])
    @labos = @user.labos.includes(:tags) # 中間テーブルを経由して関連するタグを含める
    @music_posts = @user.music_posts
  end

  # データの保存
  def update
    if @labo.update(labo_params)
      redirect_to comments_admin_user_path(@user.id, @labo.id), notice: "You have updated Labo successfully."
    else
      render "admin/users/comment"
    end
    if @misic_past.update(misic_past_params)
      redirect_to comments_admin_user_path(@user.id, @music_post.id), notice: "You have updated MusicPost successfully."
    else
      render "admin/users/comment"
    end
  end

  def destroy
    @labo_comment = LaboComment.find(params[:id])
    @labo_comment.destroy
    @music_post = MusicPost.find(params[:id])
    @music_post.destroy
    redirect_to admin_user_comments_path
  end
end
