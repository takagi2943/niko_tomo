class CreateTaglabocomments < ActiveRecord::Migration[6.1]
  def change
    create_table :taglabocomments do |t|

      t.timestamps
    end
  end
end
