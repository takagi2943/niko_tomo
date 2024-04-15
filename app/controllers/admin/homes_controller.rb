class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: :root

  def top
  end
end
