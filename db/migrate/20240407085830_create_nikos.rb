class CreateNikos < ActiveRecord::Migration[6.1]
  def change
    create_table :nikos do |t|

      t.integer :users_id,               null: false
      t.boolean :is_favorite,            null: false, default: true
      t.string  :name,
      t.integer :year,                   null: false
      t.text    :feature,                null: false

      t.timestamps
    end
  end
end
