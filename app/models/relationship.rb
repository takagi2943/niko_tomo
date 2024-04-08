class Relationship < ApplicationRecord
  
  # フォロー/フォロワーの紐づけ
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
end
