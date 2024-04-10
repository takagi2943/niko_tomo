class AddTreeTypeToNikos < ActiveRecord::Migration[6.1]
  def change
    add_column :nikos, :tree_type, :string

  end
end
