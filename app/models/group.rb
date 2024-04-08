class Group < ApplicationRecord
  
  # グループ画像
  has_one_attached :image
  
  # ユーザーと紐づけ
  belongs_to :user
  
  # グループ名とグループ紹介文の設定
  validates :name, presence: true
	validates :body, presence: true, length: { maximum: 200 }
  
  
  
  # グループの画像
  def get_group_image
    if group_image.attached?
      group_image
    else
      'no_image.jpg'
    end
  end

  
end
