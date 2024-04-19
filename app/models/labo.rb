class Labo < ApplicationRecord
  
  # タグ/探究室と探究コメントを繋ぐ
  has_many :tag_labos, dependent: :destroy
  has_many :labo_comments, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 200 }
  
  
end
