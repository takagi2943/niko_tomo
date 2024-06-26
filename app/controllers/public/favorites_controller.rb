class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  # いいね（お気に入り）一覧
  def index
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id).pluck(:music_post_id)
    @favorite_posts = MusicPost.find(@favorites)
  end
  
  def create
    # 投稿を取得
    @music_post = MusicPost.find(params[:music_post_id])
    # お気に入りを作成し、現在のユーザーに関連付ける
    favorite = current_user.favorites.new(music_post_id: @music_post.id)
    # お気に入りを保存
    favorite.save
  end
  
  def destroy
    # 投稿を取得
    @music_post = MusicPost.find(params[:music_post_id])
    # 現在のユーザーに関連付けられたお気に入りを検索
    favorite = current_user.favorites.find_by(music_post_id: @music_post.id)
    # お気に入りを削除
    favorite.destroy
  end

end
