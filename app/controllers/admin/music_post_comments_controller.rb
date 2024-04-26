class Admin::MusicPostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @music_post_comment = MusicPostComment.find_by_id(params[:id])
    @music_post_comment.destroy if @labo_comment
    redirect_to admin_music_post_path
    flash[:alert] = "音楽共有の投稿コメントを削除しました。"
  end
end
