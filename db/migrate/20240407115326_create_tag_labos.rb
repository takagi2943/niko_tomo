class CreateTagLabos < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_labos do |t|
      
      t.integer  :tag_id,   null: false
      t.integer  :labo_id,  null: false

      t.timestamps
    end
  end
end
