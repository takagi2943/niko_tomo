class Group < ApplicationRecord
  
  # グループ画像
  has_one_attached :image
  
  # ユーザーと紐づけ
  belongs_to :user
  
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
  def get_group_image
    if group_image.attached?
      group_image
    else
      'no_image.jpg'
    end
  end

  
end
