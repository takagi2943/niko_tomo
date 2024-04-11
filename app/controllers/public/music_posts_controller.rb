class Public::MusicPostsController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @music_posts = MusicPost.all
    @music_post = MusicPost.new

  end

  def show
    @music_post = MusicPost.find(params[:id])
    @music_post_comment = MusicPost.new
  end

  def create
    @music_post = MusicPost.new(music_post_params)
    @music_post.user_id = current_user.id
    if @music_post.save
      redirect_to user_music_post_path(current_user, @music_post), notice: "You have created book successfully."
    else
      @music_posts = MusicPost.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @music_post.update(music_post_params)
      redirect_to user_music_post_path(@music_post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @music_post.destroy
    redirect_to user_music_post_path
  end

  private

  def music_post_params
    params.require(:music_post).permit(:title, :body)
  end

  def ensure_correct_user
    @music_post = MusicPost.find(params[:id])
    unless @music_post.user == current_user
      redirect_to books_path
    end
  end
end
