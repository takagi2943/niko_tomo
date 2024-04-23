class Admin::MusicPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @music_posts = MusicPost.all
    @music_post_page = MusicPost.page(params[:page])
  end

  def show
    @music_post = MusicPost.find(params[:id])
    @music_post_comments = @music_post.music_post_comments
    @user = @music_post.user
  end

  def destroy
    @music_post = MusicPost.find(params[:id])
    @music_post.destroy
    redirect_to admin_music_posts_path, notice: "音楽共有の投稿を削除しました。"
  end
end
