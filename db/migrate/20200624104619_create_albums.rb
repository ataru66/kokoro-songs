class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums, id: :string do |t|
      t.string :name, null: false
      t.string :image
      t.string :release_date
    end
  end
end
