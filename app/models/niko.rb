class Niko < ApplicationRecord
  # My二胡の画像を持たせる
  has_one_attached :niko_image

  # ユーザーと紐づけ
  belongs_to :user

  # 二胡の特徴文の設定
  validates :feature, presence: true, length: { maximum: 200 }


  # 二胡の画像を持たせると表示される/持たせないと表示されない
  def get_niko_image
    (niko_image.attached?) ? niko_image : 'no-image-icon.jpg'
  end
end