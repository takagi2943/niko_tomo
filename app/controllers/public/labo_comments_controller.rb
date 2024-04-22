class Public::LaboCommentsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = current_user.id
    @labo_comment = LaboComment.new(labo_comment_params)
    @labo_comment.user_id = current_user.id
    @labo_comment.labo_id = params[:labo_id]

    if @labo_comment.save
      redirect_to labo_path(params[:labo_id])
    else
      @labo = Labo.find_by(params[:labo_id])
      render "public/labos/show"
    end
  end

  def destroy
    # 探究室の投稿を削除
    labo_comment = LaboComment.find(params[:id])
    labo_comment.destroy
    redirect_to labo_path(params[:labo_id])
  end

  private

  def labo_comment_params
    params.require(:labo_comment).permit(:comment)
  end
end
