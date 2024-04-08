class MusicPostComment < ApplicationRecord
  
  # ユーザーと音楽共有と紐づけ
  belongs_to :user
  belongs_to :music_post
  
  # 一意であることを確認
  validates_uniqueness_of :music_post_id, scope: :user_id
  # コメントの設定
	validates :comment, presence: true, length: { maximum: 200 }
  
end
