class MusicPostComment < ApplicationRecord
  
  # ユーザーと音楽共有と紐づけ
  belongs_to :user
  belongs_to :music_post
  

  # コメントの設定
	validates :comment, presence: true, length: { maximum: 200 }
  
end
