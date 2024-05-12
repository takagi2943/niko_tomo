class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      
      t.integer "user_id"
      t.text :content, null: false
      t.timestamps
    end
  end
end
