class Niko < ApplicationRecord
  # My二胡の画像を持たせる
  has_one_attached :niko_image

  # ユーザーと紐づけ
  belongs_to :user

  # 二胡の特徴文の設定
  validates :feature, length: { maximum: 200 }

  # tree_type:
  enum tree_type: {
    zitan: '0',
    laohongmu: '1',
    heitan: '2',
    other: '3'
  }
  # 二胡の画像を持たせると表示される/持たせないと表示されない
  def get_niko_image
    (self.niko_image.attached?) ? self.niko_image : 'no-image-icon.jpg'
  end
end