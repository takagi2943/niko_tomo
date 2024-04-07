class CreateGroupusers < ActiveRecord::Migration[6.1]
  def change
    create_table :groupusers do |t|

      t.integer  :user_id,       null: false
      t.integer  :group_id,      null: false

      t.timestamps
    end
  end
end
