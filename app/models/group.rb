class Group < ApplicationRecord

  # グループ画像
  has_one_attached :image

  # ユーザーと紐づけ
  belongs_to :user
  has_many :group_users

  # グループ名とグループ紹介文の設定
  validates :name, presence: true
	validates :body, presence: true, length: { maximum: 200 }

  # グループ名検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Group.where(name: content)
    elsif method == 'forward'
      Group.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Group.where('name LIKE ?', '%' + content)
    else
      Group.where('name LIKE ?', '%' + content + '%')
    end
  end


  # グループの画像
  def get_image
    image.attached? ? image : 'no-image-icon.jpg'
  end

  def is_owned_by?(user)
    self.user == user
  end
end
