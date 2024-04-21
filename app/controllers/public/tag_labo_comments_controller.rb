class Public::TagLaboCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @tag = Tag.find(params[:tag_id])
    comment = current_user.tag_labo_comment.new(tag_labo_params)
    comment.tag_labo_id = @tag_labo.id
    comment.save
  end 
  
  def destroy
    comment = TagLaboComment.find(params[:id])
    @tag_labo = comment.tag_lago
    comment.destroy
  end
  
  private
  
  def tag_labo_comment
    params.require(:tag_labo_comment).permit(:comment)
  end 
end
