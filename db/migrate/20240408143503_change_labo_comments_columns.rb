class ChangeLaboCommentsColumns < ActiveRecord::Migration[6.1]
  def change
    rename_table :tag_labo_comments, :labo_comments
    rename_column :labo_comments, :tag_labo_id, :labo_id
  end
end
