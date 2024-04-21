class Admin::LabosController < ApplicationController
  def show
    @labo = Labo.find(params[:id])
    @labo_comments = @labo.labo_comments
    @user = @labo.user
  end
end
