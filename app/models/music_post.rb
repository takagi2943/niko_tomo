class MusicPost < ApplicationRecord

  # ユーザーと紐づけ
  belongs_to :user
  
  # 投稿画像
  has_one_attached :image
  # タイトルと投稿文設定
  validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

  # タイトル検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Music_post.where(title: content)
    elsif method == 'forward'
      Music_post.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Music_post.where('title LIKE ?', '%' + content)
    else
      Music_post.where('title LIKE ?', '%' + content + '%')
    end
  end

  # 画像を選択していたら表示させ選択されてなかったら表示させない
  def get_music_post_image
    if image.attached?
      image
    else
      nil
    end
  end

end
