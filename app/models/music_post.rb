class MusicPost < ApplicationRecord
  
  # ユーザーと紐づけ
  belongs_to :user
  
  # タイトルと投稿文設定
  validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }
end
