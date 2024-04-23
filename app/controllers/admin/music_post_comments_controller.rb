class Admin::MusicPostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @music_post_comment = MusicPostCmment.find_by_id(params[:id])
    @music_post_comment.destroy if @labo_comment
    redirect_to admin_music_post_path
  end
end
