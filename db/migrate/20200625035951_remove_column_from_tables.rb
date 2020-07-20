class RemoveColumnFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :artist_id, :string, null: false
    remove_column :posts, :song_id, :string, null: false
    remove_column :posts, :artist, :string, null: false
    remove_column :posts, :song, :string, null: false
  end
end
