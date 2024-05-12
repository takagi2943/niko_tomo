class MusicPost < ApplicationRecord

  # ユーザーと紐づけ
  belongs_to :user

  # この投稿に関連するお気に入りの情報を取得する
  has_many :favorites, dependent: :destroy

  # この投稿に関連するコメントの情報を取得する
  has_many :music_post_comments, dependent: :destroy

  # この投稿に関連する画像をAI画像認識の情報を取得する
  has_many :ai_tags, dependent: :destroy

  # 投稿画像
  has_one_attached :image
  # タイトルと投稿文設定
  validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

  # この投稿をお気に入りに追加しているかどうかを確認する
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # この投稿のお気に入りの数を取得する
  def favorites_count
    favorites.count
  end

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

  # ソート機能
  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:music_post_id).order(Arel.sql('count(music_post_id) desc')).pluck(:music_post_id))
    when 'dislikes'
      return find(Favorite.group(:music_post_id).order(Arel.sql('count(music_post_id) asc')).pluck(:music_post_id))
    end
  end

  # 画像を選択していたら表示
    def get_music_post_image
      self.image.attached? ? self.image : 'no-image-icon.jpg'
    end

end
