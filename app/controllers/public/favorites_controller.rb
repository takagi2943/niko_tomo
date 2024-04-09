class Public::FavoritesController < ApplicationController
  
  # いいね（お気に入り）一覧
  def index
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id).pluck(:music_post_id)
    @favorite_posts = MusicPost.find(@favorites)
  end
end
