class Admin::LaboCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @labo_comments = LaboComment.all
    @labo_comment = LaboComment.page(params[:page])
  end

  def show
    @labo_comment = LaboComment.find(params[:id])
  end
end
