class Contact < ApplicationRecord

  # 内容の設定
  validates :content, presence: true
end
