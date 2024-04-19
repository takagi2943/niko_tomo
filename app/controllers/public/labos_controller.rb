class Public::LabosController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @users = User.all
    @user = current_user
    @labo = Labo.new
    @tags = Tag.all
    @labo_comment = LaboComment.all
    @labo_comments = LaboComment.page(params[:page]) #ページネーション
  end

  def show
    @labo_comment = LaboComment.find(params[:id])
  end
  
  def create
    @labo_comment = LaboComment.new(labo_comment_params)
    @tags = Tag.all
    if @labo_comment.save
      redirect_to labos_path
    else 
      render 'public/labos/index'
    end
  end
  
  def destroy
    @labo_comment = LaboComment.find(params[:id])
    @labo_comment.destroy
  end 
  
  private
  
  def labo_comment_params
    params.require(labo_comment).parmit(:comment, :tag_id)
  end 
end
