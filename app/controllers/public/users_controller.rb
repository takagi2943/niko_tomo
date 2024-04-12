class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_not_guest_user, only: [:update, :destroy]

  def show
    @niko = Niko.all
    @user = User.all
    # @music_post = Music_post.new
    @user = User.find(params[:id])
    @music_posts = @user.music_posts

  end

  def edit
    @user = User.find(params[:id])
    @niko = @user.nikos.find_by(id: params[:niko_id]) || @user.nikos.build

    if @user.guest_user?
      flash.now[:alert] = "ゲストユーザーは変更を保存することはできません。"
    end
    # @niko = Niko.new

    # @niko_tree_type = Niko.new
  end

  def comfirm
  end

  def create
    @niko_tree_type = Niko.new(niko_params)
    if @niko_tree_type.save
      # 保存成功時の処理
      redirect_to user_user_path, notice: "保存しました。"
    else
      # 保存失敗時の処理
      render :edit
    end
  end


  def update
    if @user.update(user_params)
      render json: { status: 'success', redirect_url: user_user_path(@user) }
    else
      render json: { status: 'error', errors: @user.errors.full_messages }
    end
  end


  private

  def niko_tree_type_parame
    params.require(:niko_tree_type).permit(:tree_type)
  end

  # ゲストログイン縛りの設定
  def ensure_not_guest_user
    if current_user.guest_user?
      flash[:error] = "ゲストユーザーはこの操作を実行できません。"
      redirect_to edit_user_path(current_user)
    end
  end
end
