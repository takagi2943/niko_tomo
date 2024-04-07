class CreateLabos < ActiveRecord::Migration[6.1]
  def change
    create_table :labos do |t|

      t.timestamps
    end
  end
end
