class Public::UserMusicPostsController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def create
    @music_post = MusicPost.new(music_post_params)
    @music_post.user_id = current_user.id
    if @music_post.save
      redirect_to user_path(@user, @music_post), notice: "You have created book successfully."
    else
      @music_posts = MusicPost.all
      render 'index'
    end
  end

end
