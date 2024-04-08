class TagLabo < ApplicationRecord
  
  # タグと探究室を結ぶ中間テーブル
  belongs_to :tag
  belongs_to :Iabo
  
  # 一意であることを確認
  validates_uniqueness_of :Iabo_id, scope: :tag_id
  validates :title, presence: true
  
end
