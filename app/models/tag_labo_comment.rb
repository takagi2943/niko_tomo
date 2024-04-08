class TagLaboComment < ApplicationRecord
  
  # タグ探究室とユーザーの紐づけ
  belongs_to :user
  belongs_to :labo
  # 一意であることを確認
  validates_uniqueness_of :labo_id, scope: :user_id
  # コメントの設定
  validates :comments, presence: true, length: { maximum: 200 }

end
