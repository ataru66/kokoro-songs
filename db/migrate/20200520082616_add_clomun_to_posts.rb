class AddClomunToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :artist_id, :string, null: false
    add_column :posts, :song_id, :string, null: false
  end
end
