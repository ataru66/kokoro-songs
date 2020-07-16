class CreateArtistsTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_tracks do |t|
      t.references :artist, foreign_key: true, null: false, type: :string
      t.references :track, foreign_key: true, null: false, type: :string
    end
  end
end
