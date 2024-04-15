class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]


  def index
    @group = Group.new # 新しくグループ作成
    @groups = Group.all
    @user = current_user
  end

  def show
    @group = Group.find(params[:id])
    @user = @group.owner
    @user_self = User.find(params[:id])
    @participant_size = @group.group_users.size
  end

  # グループに参加する
  def join
    @group =Group.find(params[:group_id])
    @group.users << current_user
    redirect_to group_path(@group.id)
  end

  # グループを離れる
  def leave
    @group = Group.find(params[:id])
    group_user = @group.group_users.find_by(user_id: current_user.id)
    if group_user
      group_user.destroy
      flash[:success] = "グループから脱退しました"
    else
      flash[:error] = "グループメンバーが見つかりません"
    end
    redirect_to groups_path
  end


  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    # 下記の記述は@group.usersに、current_userを追加しているということ
    @group.users << current_user
    # グループのができたら
    if @group.save
      redirect_to groups_path
    else
      # できなかったらグループの情報を引き継いで戻る
      @groups = Group.all
      @music_posts = MusicPost.new
      @user = current_user
      render :index
    end
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'index'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @groups, notice: 'グループ情報が更新されました。'
    else
      render :edit
    end
  end
  private

  def group_params
    params.require(:group).permit(:name, :body, :image)
  end

  # 指定されたグループが現在ログインしているユーザーの所有
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.user.id == current_user.id
      redirect_to group_path
    end
  end
end