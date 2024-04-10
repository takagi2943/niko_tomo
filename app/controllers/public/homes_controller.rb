class Public::HomesController < ApplicationController
  def top
    @labos = Labo.all
  end

  def about
  end
end
