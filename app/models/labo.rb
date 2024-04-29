class Labo < ApplicationRecord

  # タグ/探究室と探究コメントを繋ぐ
  has_many :tag_labos, dependent: :destroy
  has_many :tags, through: :tag_labos
  has_many :labo_comments, dependent: :destroy
  belongs_to :user

  validates :body, presence: true, length: { maximum: 200 }
  validates :tags, presence: true
end
