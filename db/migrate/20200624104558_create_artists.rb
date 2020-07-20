class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists, id: :string do |t|
      t.string :name, null: false
      t.string :image
    end
  end
end
