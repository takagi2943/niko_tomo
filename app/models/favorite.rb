class Favorite < ApplicationRecord
  
  # ユーザーと音楽共有を紐づる中間テーブル
  belongs_to :user
  belongs_to :music_post
  
  # 一意であることを確認
  validates_uniqueness_of :music_post_id, scope: :user_id
  
end
