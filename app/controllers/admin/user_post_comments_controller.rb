class Admin::UserPostCommentsController < ApplicationController
   before_action :authenticate_admin!, except: :root
   
  def index
  end
end
