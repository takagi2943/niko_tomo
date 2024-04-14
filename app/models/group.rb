class Group < ApplicationRecord

  # グループ画像
  has_one_attached :image

  # ユーザーと紐づけ
  belongs_to :user  # Groupモデルが特定のUserに属していることを示す
  has_many :group_users, dependent: :destroy  # 中間テーブルgroup_usersを介して多対多の関係を持つ
  has_many :users, through: :group_users  # 多対多の関係を持つユーザー
  belongs_to :owner, class_name: 'User'  # Groupモデルが所有者(User)と関連していることを示す


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

  # viewで渡した引数の照らし合わせ
  def is_owned_by?(user)
    self.user == user
  end
end
