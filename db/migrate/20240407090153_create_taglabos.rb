class CreateTaglabos < ActiveRecord::Migration[6.1]
  def change
    create_table :taglabos do |t|

      t.timestamps
    end
  end
end
