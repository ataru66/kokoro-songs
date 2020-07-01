class CreateArtistsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_posts do |t|
      t.references :artist, foreign_key: true, null: false, type: :string
      t.references :post, foreign_key: true, null: false
    end
  end
end
