class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: :root

  def top
    @users = User.all
    @user_name = User.order('id DESC').limit(4)
    @groups = Group.all
    @group_name = Group.order('id DESC').limit(4)
    @music_posts = MusicPost.all
    @music_post_name = MusicPost.order('id DESC').limit(4)
    @labos = Labo.all
    @labo_name = Labo.order('id DESC').limit(4)
    @total_active_users = User.where(is_active: false).size
    @total_inactive_users = User.where(is_active: true).size
    @total_users = User.all.size
  end
end
