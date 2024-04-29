class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @total_active_users = User.where(is_active: true).size
    @total_inactive_users = User.where(is_active: false).size
    @total_users = User.all.size
    @groups = Group.order('id DESC').limit(4)
    @music_posts = MusicPost.order('id DESC').limit(4)
    @labos = Labo.order('id DESC').limit(4)
  end
  
  def search
    # @model = params[:model]
    # @content = params[:content]
    # @method =params[:method]

    # # 選択したモデルに応じて検索を実行
    # if @model == 'user'
    #   @records = User.search_for(@content, @method)
    # else
    #   @records = MusicPost.search_for(@content, @method)
    # end
    if params[:search]
      @users = User.where('nickname LIKE ?', "%#{params[:search]}%")
      @user_page = User.page(params[:page])
    else
      @users = User.all
      @user_page = User.page(params[:page])
    end
  end
end
