class Public::NikosController < ApplicationController
  before_action :authenticate_user!
  # 新しい二胡の情報を作成するアクション
  def create
    @user = current_user
    @niko = @user.nikos.build(niko_params)

    if @niko.save
      redirect_to edit_user_path(@user), notice: '二胡の情報が作成されました。'
    else
      render "public/users/edit" # 二胡の情報を入力するフォームを表示するビューへリダイレクト
    end
  end

  # 既存の二胡の情報を更新するアクション
  def update
    @user = current_user
    @niko = @user.nikos.find(params[:id])

    if @niko.update(niko_params)
      redirect_to edit_user_path(@user), notice: '二胡の情報が更新されました。'
    else
      flash.now[:alert] = "編集内容を確認してください"
      render "public/users/edit" # 二胡の情報を入力するフォームを表示するビューへリダイレクト
    end
  end

  # 二胡の情報を削除するアクション
  def destroy
    @user = current_user
    @niko = @user.nikos.find(params[:id])
    @niko.destroy
    redirect_to edit_user_path(@user), notice: '削除に成功しました。'
  end

  private

  # Strong Parametersを使用してフォームからのパラメーターを許可します
  def niko_params
    params.require(:niko).permit(:niko_image, :tree_type, :year, :name, :feature, :is_favorite)
  end
end
