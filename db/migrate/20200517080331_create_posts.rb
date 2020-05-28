class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.string :artist, null: false
      t.string :song, null: false
      t.timestamps
    end
  end
end
