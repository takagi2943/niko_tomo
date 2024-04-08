class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 画像持たせる
  has_one_attached :image

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

  enum gender: { noinput: 9, other: 0, man: 1, woman: 2 }
  enum user_status: {
    noInput: 9,
    user_other: 0,
    user_man: 1,
    user_woman: 2,
  }

  private

  # 会員ステータス
  def user_status
    is_active ? "有効" : "退会"
  end
end
