class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  	def search
  	  @genre_id = @params[:genre_id]
  	  @tags = Tag.wher(genre_id: @tag_id)
  	end
end
