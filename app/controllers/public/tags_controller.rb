class Public::TagsController < ApplicationController
  before_action :authenticate_user!

  def labos
    @tag = Tag.find(params[:id])
    @labos = @tag.labos
    @labo_comment = LaboComment.new
  end

  def destroy
    @tag.labo.destroy
    redirect_to labos_path
  end


end


