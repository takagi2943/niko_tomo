class GroupUser < ApplicationRecord
  
  # ユーザとグループの中間テーブル
  belongs_to :user
  belongs_to :group
  
  # 一意であることを確認
  validates_uniqueness_of :group_id, scope: :user_id
  
end
