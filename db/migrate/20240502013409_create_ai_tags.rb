class CreateAiTags < ActiveRecord::Migration[6.1]
  def change
    create_table :ai_tags do |t|
      t.integer  :music_post_id
      t.string   :name

      t.timestamps
    end
  end
end
