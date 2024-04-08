class Niko < ApplicationRecord
  # My二胡の画像を持たせる
  has_one_attached :image

  # ユーザーと紐づけ
  belongs_to :user
  
  # 二胡の特徴文の設定
  validates :feature, presence: true, length: { maximum: 200 }

  # お気に入りの二胡を表示させる
  def status
    is_favorite ? "true" : "false"
  end
end