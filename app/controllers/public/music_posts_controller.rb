class Public::MusicPostsController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]
   before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @music_posts = MusicPost.all
    @music_post = MusicPost.new
    
    # ソート機能
    def search
      selection = params[:keyword]
      @music_posts = MusicPost.sort(selection)
    end 
    # if params[:latest]
    #   @music_posts = MusicPost.latest
    # elsif params[:old]
    #   @music_posts = MusicPost.old
    # elsif params[:favorite_count]
    #   @music_posts = MusicPost.favorite_count
    # else
    #   @music_posts = MusicPost.all
    # end
      
    # ページネーション
    @music_posts = MusicPost.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @music_post = MusicPost.find(params[:id])
    @new_music_post = MusicPost.new
    @music_post_comment = MusicPostComment.new
  end

  def create
    @music_post = MusicPost.new
    # ストロングパラメータで許可した値を持ってくる
    @music_post.title = params[:music_post][:title]
    @music_post.body = params[:music_post][:body]
    @music_post.image = params[:music_post][:image]
    @music_post.user_id = current_user.id
    # AIの画像認識
    @ai_tags = Vision.get_image_data(music_post_params[:image])
    if @music_post.save
      # AIの画像タグ
      @ai_tags.each do |ai_tag|
        @music_post.ai_tags.create(name: ai_tag)
      end
      # viewとcontroller側でchange_redirect_pathのリダイレクト先をtrueとfalseで分けている
      if params[:music_post][:change_redirect_path]  # trueだったら
        flash[:notice] = '投稿しました。'
        redirect_to music_post_path(@music_post)
      else
       flash[:notice] = '投稿しました。' # false
        redirect_to request.referer
      end
    else
      @music_posts = MusicPost.all
      flash[:alert] = '内容を確認してください。'
      render 'index'
    end
  end

  def edit
  end

  def update
    if @music_post.update(music_post_params)
      redirect_to music_post_path(@music_post), notice: "投稿内容を編集しました。"
    else
      render "edit"
    end
  end

  def destroy
    @music_post.destroy
    redirect_to music_posts_path, notice: '投稿を削除しました。'

  end

  private

  # ユーザー自身の投稿編集以外のページにアクセスしようとした場合にはアクセスを拒否
  def correct_user
    @music_post = MusicPost.find_by(id: params[:id])
    unless @music_post && current_user == @music_post.user
      redirect_to(root_path, alert: "不正なアクセスです")
    end
  end

  def music_post_params
    params.require(:music_post).permit(:title, :body, :image)
  end

  def ensure_correct_user
    @music_post = MusicPost.find(params[:id])
    unless @music_post.user == current_user
      redirect_to user_music_posts_path
    end
  end


end
