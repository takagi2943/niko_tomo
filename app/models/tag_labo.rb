class TagLabo < ApplicationRecord
  
  # タグと探究室を結ぶ中間テーブル
  belongs_to :tag
  belongs_to :labo
  
  # 一意であることを確認
  validates_uniqueness_of :labo_id, scope: :tag_id
  
end
