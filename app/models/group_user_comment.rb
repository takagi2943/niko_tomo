class GroupUserComment < ApplicationRecord
  
  # 投稿した場合の画像
  has_one_attached :image
  
  # ユーザーとグループの紐づけ
  belongs_to :user
  belongs_to :group
  
  # コメントの設定
  validates :comments, presence: true, length: { maximum: 200 }
  
  # グループ内で投稿するときに画像を表示できる
  def group_comment_image
    if image.attached?
      image
    else
      nil
    end
  end
end
