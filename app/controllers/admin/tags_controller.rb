class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  # タグ一覧・タグ追加・タグの編集
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def edit
    @tag_edit = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] ="タグを新しく追加しました"
      redirect_to admin_tags_path
    else
      flash.now[:error] = "入力内容を確認してください"
      @tags = Tag.all
      render :index
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:update] = "タグを更新しました"
      redirect_to admin_tags_path
    else
      flash.now[:notice] = "編集内容を確認してください"
      render :index
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    @tags = Tag.all
    redirect_to admin_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
