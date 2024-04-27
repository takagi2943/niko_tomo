class Public::LabosController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    @labo = Labo.new
    @labos = Labo.all
    @tags = Tag.all
  end


  def show
    @labo = Labo.find(params[:id])
    @labo_comment = LaboComment.new
  end

  def create
    @labo = Labo.new(labo_params)
    @labo.user_id = current_user.id
    # 探究室の投稿が成功したら
    if @labo.save
      flash[:notice] = '投稿に成功しました。'
      redirect_to labos_path
    else
      @labos = Labo.all # 追加
      @tags = Tag.all  # 追加
      flash[:alert] = '内容を確認してください。'
      render 'index'
    end
  end

  def destroy
    # 探究室の投稿を削除
    @labo = Labo.find(params[:id])
    @labo.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to labos_path
  end

  private

  def labo_params
    params.require(:labo).permit(:body, tag_ids: [])
  end
end
