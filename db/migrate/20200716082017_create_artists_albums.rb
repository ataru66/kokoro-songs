class CreateArtistsAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_albums do |t|
      t.references :artist, foreign_key: true, null: false, type: :string
      t.references :album, foreign_key: true, null: false, type: :string
    end
  end
end
