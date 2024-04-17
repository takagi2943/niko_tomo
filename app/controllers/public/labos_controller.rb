class Public::LabosController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @users = User.all
    @user = current_user
    @tags = Tag.all
    @labo_comment = LaboComment.all
  end

  def show
  end
end
