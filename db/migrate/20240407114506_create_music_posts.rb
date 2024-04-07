class CreateMusicPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :music_posts do |t|
      
      t.integer  :user_id,   null: false
      t.string   :title,     null: false
      t.text     :body,      null: false

      t.timestamps
    end
  end
end
