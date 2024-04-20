class Public::LabosController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @users = User.all
    @user = current_user
    @labo = Labo.new
    @labos =Labo.all
    @tags = Tag.all
    @labo_body = Labo.all
    @labo_pages = Labo.page(params[:page]) #ページネーション
  end
  

  def show
    @labo = Labo.find_dy(user.id)
    @labo_comment = @labo.labo_comment.new(labo_commnt_params)
    @tag = Tag.find(params[:id])
  end

  def create
    @labo = Labo.new(labo_params)
    @labo.user_id = current_user.id
    # 探究室の投稿が成功したら
    if @labo.save
      redirect_to labos_path
    else
    # 探究室の投稿コメントに成功したら
      render 'index'
    end
  end

  def destroy
    # 探究室の投稿を削除
    @labo = Labo.find(params[:id])
    @labo.destroy
    # 探究室の投稿コメントを削除
    @labo_comment = LaboComment.find(params[:id])
    @labo_comment.destroy
  end

  private

  def labo_comment_params
    params.require(:labo_comment).permit(:comment, :tag_id, :labo_id)
  end

  def labo_params
    params.require(:labo).permit(:body)
  end
end
