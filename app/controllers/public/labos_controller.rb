class Public::LabosController < ApplicationController
before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
  end

  def show
  end
end
