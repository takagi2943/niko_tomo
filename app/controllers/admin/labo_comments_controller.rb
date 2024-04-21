class Admin::LaboCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @labo_comments = LaboComment.all
    @labo_comment = LaboComment.page(params[:page])
  end

  def show
    @labo_comment = LaboComment.find(params[:id])
  end
  
  def destroy
    @labo_comment = LaboComment.find_by_id(params[:id])
    @labo = @labo_comment.labo
    @labo_comment.destroy if @labo_comment
    redirect_to admin_labo_path(@labo)
  end
end
