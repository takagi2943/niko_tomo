class Admin::LabosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @labo = Labo.all
    @labo = Labo.find(params[:id])
  end 
  
  def show
    @labo = Labo.find(params[:id])
    @labo_comments = @labo.labo_comments
    @user = @labo.user
  end
end
