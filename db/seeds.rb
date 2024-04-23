# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
Admin.create!(
   email: 'nikotomo@gmail',
   password: 'nikotomo',
)

# 会員情報
User.create!(
  [
    { nickname: '二胡爺', email: 'g@g', is_active: true, gender: 'man', introduction: '初めまして', password: '123123', birthdate: '1968/4/20' },
    { nickname: '二胡姫', email: 'j@j', is_active: true, gender: 'woman', introduction: '初めましてよろしくね', password: '123123', birthdate: '1988/2/12' },
    { nickname: 'もっちー', email: 'q@q', is_active: true, gender: 'other', introduction: '初めまして', password: '123123', birthdate: '1968/4/21' },
    { nickname: '二胡にぃ', email: 'k@k', is_active: true, gender: 'man', introduction: '初めまして', password: '123123', birthdate: '1968/4/21' },
    { nickname: '二胡姉', email: 'm@m', is_active: true, gender: 'man', introduction: '初めまして', password: '123123', birthdate: '1968/4/21' },
    { nickname: '二胡人', email: 'w@w', is_active: true, gender: 'other', introduction: '初めまして', password: '123123', birthdate: '1968/4/16' },
    { nickname: 'かっきー', email: 'y@y', is_active: true, gender: 'woman', introduction: '初めまして', password: '123123', birthdate: '1968/4/5' },
    { nickname: 'つっちー', email: 'r@r', is_active: true, gender: 'other', introduction: 'こんにちは', password: '123123', birthdate: '1968/4/22' },
    { nickname: 'ムッチー', email: 'x@x', is_active: true, gender: 'man', introduction: '初めまして', password: '123123', birthdate: '1968/4/22' },
    { nickname: 'マオマオ', email: 'z@z', is_active: true, gender: 'other', introduction: '初めまして', password: '123123', birthdate: '1968/4/22' }
  ]
)

MusicPost.create!(
  [
    { user_id: 1, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 2, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 3, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 4, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 5, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 6, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 7, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 8, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 9, title:'二胡始めました。', body: '記録として始めようと思います。' },
    { user_id: 10, title:'二胡始めました。', body: '記録として始めようと思います。' }
    ]
  )

Niko.create!(
  [
    { user_id: 1, is_favorite: true, name: 'にーにー', year: 2, feature: 'とても滑らかな音色が出ます。ニシキヘビの模様も気に入っております。', tree_type: '0'},
    { user_id: 2, is_favorite: true, name: 'しーた', year: 2, feature: '購入して日が浅いので固い音色ですが色が気に入っております。', tree_type: '3'},
    { user_id: 3, is_favorite: true, name: 'こく', year: 2, feature: 'とても滑らかでさわやかな音色が出ます。風邪を引いたような音がよく出るのですが、気に入っております。', tree_type: '2'},
    { user_id: 4, is_favorite: true, name: 'ベニマル', year: 2, feature: 'ニシキヘビの模様が特に気に入っております。一番のお気に入りの二胡です', tree_type: '1'},
    { user_id: 5, is_favorite: true, name: '二胡', year: 2, feature: '名前を付けて大事に大事に使っております。弾き比べで聴いてとても気に入りました。。', tree_type: '0'},
    { user_id: 6, is_favorite: true, name: 'バリュー', year: 2, feature: 'とても滑らかな音色が出ます。この二胡で二代目になります。二胡の美しさでは絶対に負けないと勝手に思っています。', tree_type: '0'},
    { user_id: 7, is_favorite: true, name: 'ローム', year: 2,  feature: '老師のおすすめされた二胡です。音色はよく分からないのですが、大切に使います。', tree_type: '0'},
    { user_id: 8, is_favorite: true, name: 'しーちゃん', year: 2, feature: 'しっとりとした美しい音色が出ます。水を含んでいるのかというほどのまとわりついてくる音色はとても感動します。', tree_type: '0'},
     { user_id: 9, is_favorite: true, name: 'シオン', year: 2, feature: '弾いていたら聴き惚れてしまい曲の練習にならないほど気に入っています。', tree_type: '1'},
    { user_id: 10, is_favorite: true, name: 'くろ', year: 2, feature: 'とても滑らかな音色が出ます。聴いた中で一番美しい音色が出ていたのでこの子に決めました。。', tree_type: '0'}
  ]
 )

 Tag.create!(
   [
     { title: '二胡初心者' },
     { title: '基礎知識' },
     { title: '練習曲' },
     { title: '悩み事' },
     { title: '使用している二胡' },
     { title: '直接買える店舗' }
   ]
  )

  Group.create!(
    [
      { user_id: 1, name: '二胡友', body: '二胡による二胡の為のグループです。お気軽に参加ください。', },
      { user_id: 2, name: '二胡好き集まれ', body: '二胡好きが集まるグループです。', },
      { user_id: 3, name: '二胡一番', body: 'お気軽に参加ください。', },
      { user_id: 4, name: '弾き語り', body: '二胡に関連するグループです。お気軽に参加ください。', },
      { user_id: 5, name: '友', body: '二胡とは友達！', },
      { user_id: 6, name: '二胡笑顔', body: '一緒に参加しましょう！', },
      { user_id: 7, name: 'ゆるりと', body: 'ゆる～くお付き合いしましょ♪', },
      { user_id: 8, name: '二胡(^▽^)/', body: '一緒に遊びましょ～,' },
      { user_id: 9, name: '二胡', body: '二胡にっこにこ。お気軽に参加ください。', },
      { user_id: 10, name: 'まったり', body: 'まったり過ごしましょう。お気軽に参加ください。', }
      ]
    )