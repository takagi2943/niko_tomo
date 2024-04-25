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
end
