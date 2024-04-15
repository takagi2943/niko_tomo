class Admin::LaboCommentsController < ApplicationController
  before_action :authenticate_admin!, except: :root
  
  def index
  end

  def show
  end
end
