class Admin::GroupUsersController < ApplicationController
 before_action :authenticate_admin!, except: :root

  def index
  end
end
