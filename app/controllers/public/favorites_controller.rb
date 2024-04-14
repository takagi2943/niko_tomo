class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  # いいね（お気に入り）一覧
  def index
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id).pluck(:music_post_id)
    @favorite_posts = MusicPost.find(@favorites)
  end
  
  def create
    @music_post = MusicPost.find(params[:music_post_id])
    favorite = current_user.favorites.new(music_post_id: @music_post.id)
    favorite.save
  end

  def destroy
    @music_post = MusicPost.find(params[:music_post_id])
    favorite = current_user.favorites.find_by(music_post_id: @music_post.id)
    favorite.destroy

  end
end
