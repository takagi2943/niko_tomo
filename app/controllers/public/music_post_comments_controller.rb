class Public::MusicPostCommentsController < ApplicationController
   before_action :authenticate_user!

  def create
    @music_post = MusicPost.find(params[:music_post_id])
    comment = current_user.music_post_comments.new(music_post_comment_params)
    comment.music_post_id = @music_post.id
    comment.save
    
  end

  def destroy
    comment = MusicPostComment.find(params[:id])
    @music_post = comment.music_post
    comment.destroy
  end

  private

  def music_post_comment_params
    params.require(:music_post_comment).permit(:comment)
  end
end
