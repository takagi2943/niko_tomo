class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  def  labos
    @tag = Tag.find(params[:id])
    @labos = @tag.labos
    
  end
end


