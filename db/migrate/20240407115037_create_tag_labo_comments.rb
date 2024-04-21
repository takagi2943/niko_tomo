class CreateTagLaboComments < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_labo_comments do |t|
      
      t.integer  :tag_labo_id,   null: false
      t.integer  :user_id,       null: false
      t.text     :comment,      null: false

      t.timestamps
    end
  end
end
