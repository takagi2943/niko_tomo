class Niko < ApplicationRecord
  # My二胡の画像を持たせる
  has_one_attached :image

  # ユーザーと紐づけ
  belongs_to :user
  
  # 二胡の特徴文の設定
  validates :feature, presence: true, length: { maximum: 200 }

  private
  # 二胡の画像を持たせると表示される/持たせないと表示されない
  def niko_image
    if image.attached?
      image
    else
      nil
    end
  end
end