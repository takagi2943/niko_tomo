class Contact < ApplicationRecord
  # userとお問い合わせを繋ぐ
  belongs_to :user

  # 内容の設定
  validates :content, presence: true
end
