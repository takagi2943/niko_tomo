class Public::HomesController < ApplicationController
  
  def top
    @tags = Tag.all
    # 最初のタグを取得し、そのタグに関連付けられたlaboレコードを取得
    #first_tag_labo = TagLabo.find_by(tag_id: @tags.first.id)
    #@labo = first_tag_labos.first if first_tag_labo.present?
  end

  def about
  end
end

