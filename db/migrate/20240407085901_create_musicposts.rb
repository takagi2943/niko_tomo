class CreateMusicposts < ActiveRecord::Migration[6.1]
  def change
    create_table :musicposts do |t|

      t.integer  :user_id,       null: false
      t.string   :title,         null: false
      t.text     :body,          null: false

      t.timestamps
    end
  end
end
