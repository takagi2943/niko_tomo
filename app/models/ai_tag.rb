class AiTag < ApplicationRecord
  # 音楽共有と紐づけ
  belongs_to :music_post
end
