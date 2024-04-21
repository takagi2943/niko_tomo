class Public::LabosController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @labo = Labo.new
    @labos = Labo.all
    @tags = Tag.all
  end


  def show
    @labo = Labo.find_by(params[:id])
    @labo_comment = LaboComment.new
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

  def labo_params
    params.require(:labo).permit(:body, tag_ids: [])
  end
end
