class CreateMusicpostcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :musicpostcomments do |t|
      
      t.integer  :user_id,           null: false
      t.user_id  :music_post_id,     null: false
      t.text     :comment,           null: false
      
      t.timestamps
    end
  end
end
