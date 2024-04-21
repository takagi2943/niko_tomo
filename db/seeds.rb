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
    { nickname: '二胡爺', email: 'g@g', is_active: true, gender: '男性', introduction: '初めまして', password: '123123', birthdate: '1968/4/20' },
    { nickname: '二胡姫', email: 'j@j', is_active: true, gender: '女性', introduction: '初めましてよろしくね', password: '123123', birthdate: '1988/2/12' },
    { nickname: 'もっちー', email: 'q@q', is_active: true, gender: 'その他', introduction: '初めまして', password: '123123', birthdate: '1968/4/21' },
    { nickname: '二胡にぃ', email: 'k@k', is_active: true, gender: '男性', introduction: '初めまして', password: '123123', birthdate: '1968/4/21' },
    { nickname: '二胡姉', email: 'm@m', is_active: true, gender: '男性', introduction: '初めまして', password: '123123', birthdate: '1968/4/21' },
    { nickname: '二胡人', email: 'w@w', is_active: true, gender: 'その他', introduction: '初めまして', password: '123123', birthdate: '1968/4/16' },
    { nickname: 'かっきー', email: 'y@y', is_active: true, gender: '女性', introduction: '初めまして', password: '123123', birthdate: '1968/4/5' },
    { nickname: 'つっちー', email: 'r@r', is_active: true, gender: 'その他', introduction: 'こんにちは', password: '123123', birthdate: '1968/4/22' },
    { nickname: 'ムッチー', email: 'x@x', is_active: true, gender: '男性', introduction: '初めまして', password: '123123', birthdate: '1968/4/22' },
    { nickname: 'マオマオ', email: 'z@z', is_active: true, gender: 'その他', introduction: '初めまして', password: '123123', birthdate: '1968/4/22' }
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
    { user_id: 1, is_favorite: true, name: 'にーにー', year: 2, feature: '紫檀'},
    { user_id: 2, is_favorite: true, name: 'しーた', year: 2, feature: '紫檀'},
    { user_id: 3, is_favorite: true, name: 'こく', year: 2, feature: '黒檀'},
    { user_id: 4, is_favorite: true, name: 'ベニマル', year: 2, feature: '老紅木'},
    { user_id: 5, is_favorite: true, name: '二胡', year: 2, feature: '紫檀'},
    { user_id: 6, is_favorite: true, name: 'バリュー', year: 2, feature: '紫檀'},
    { user_id: 7, is_favorite: true, name: 'ローム', year: 2, feature: '紫檀'},
    { user_id: 8, is_favorite: true, name: 'しーちゃん', year: 2, feature: '紫檀'},
    { user_id: 9, is_favorite: true, name: 'シオン', year: 2, feature: '老紅木'},
    { user_id: 10, is_favorite: true, name: 'くろ', year: 2, feature: '紫檀'}
  ]
 )