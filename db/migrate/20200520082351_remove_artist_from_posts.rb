class RemoveArtistFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :artist, :string
    remove_column :posts, :song, :string
  end
end
