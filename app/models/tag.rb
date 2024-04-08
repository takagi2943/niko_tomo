class Tag < ApplicationRecord
  
  # タグ/探究室を繋ぐ
  has_many :tag_labos, dependent: :destroy
  
  # タグの種類
  validates :title, presence: true
end
