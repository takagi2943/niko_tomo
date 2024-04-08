class GroupUserComment < ApplicationRecord
  
  # 投稿した場合の画像
  has_one_attached :image
  
  # ユーザーとグループの紐づけ
  belongs_to :user
  belongs_to :group
  
  # コメントの設定
  validates :comments, presence: true, length: { maximum: 200 }
  

end
