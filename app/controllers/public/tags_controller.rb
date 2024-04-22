class Public::TagsController < ApplicationController
  before_action :authenticate_user! , only: [:create, :destroy]

  def labos
    @tag = Tag.find(params[:id])
    @labos = @tag.labos
    @labo_comment = LaboComment.new
  end

  def destroy
    @tag.labo.find(params[:labo_id]).destroy
    redirect_to labos_path
  end


end


