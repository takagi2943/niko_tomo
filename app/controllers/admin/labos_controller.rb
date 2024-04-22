class Admin::LabosController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @labos = Labo.all
  end 
  
  def show
    @tag = Tag.find(params[:id])
    @labo = Labo.find(params[:id])
    @labo_comments = @labo.labo_comments
    @user = @labo.user
  end
  
  def destroy
    @labo = Labo.find(params[:id])
    @labo.destroy
    redirect_to admin_labos_path, notice: "探究室の投稿を削除しました。"
  end
end
