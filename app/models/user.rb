class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 二胡の情報
  has_many :nikos, dependent: :destroy
  # 音楽共有投稿
  has_many :music_posts, dependent: :destroy
  # 音楽共有コメント（中間テーブル）
  has_many :music_post_comments, dependent: :destroy
  # グループ
  has_many :groups, dependent: :destroy
  # ユーザーグループ（中間テーブル）
  has_many :group_users, dependent: :destroy
  # 画像持たせる
  has_one_attached :profile_image
  # グループ内コメント
  has_many :group_user_comments, dependent: :destroy
  # お気に入り（中間テーブル）
  has_many :favorites, dependent: :destroy
  # 探究室
  has_many :labos, dependent: :destroy
  # 探究室コメント
  has_many :tag_labo_comments, dependent: :destroy

  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  # 名前と自己紹介文の設定
  validates :nickname, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  # 性別の選択設定
  enum gender: { noinput: 9, other: 3, man: 1, woman: 2 }

  # ゲストログイン設定
  GUEST_USER_EMAIL = "guest@example.com"
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end


  # 会員ステータス
  def user_status
    is_active ? "有効" : "退会"
  end

    # 画像の情報
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # 検索機能の情報　ニックネーム
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
end
