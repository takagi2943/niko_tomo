class Admin::LaboCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @labos = LaboComment.all
    @tag = Tag.all
    @labo_pages = Labo.page(params[:page])
    
  end

  def show
    @labo = Labo.find(params[:id])
    @labo_comments = @labo.labo_commets
  end
  
  def destroy
    @labo_comment = LaboComment.find_by_id(params[:id])
    @labo = @labo_comment.labo
    @labo_comment.destroy if @labo_comment
    redirect_to admin_labo_path(@labo)
    flash[:alert] = "探究室のコメントを削除しました。"
  end
end
