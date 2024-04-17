class Admin::UserCommentsController < ApplicationController
  before_action :authenticate_user!
  
  # 会員の投稿した一覧取得
  def comment
    @labos = Labo.all
    @music_posts = MusicPost.all
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
