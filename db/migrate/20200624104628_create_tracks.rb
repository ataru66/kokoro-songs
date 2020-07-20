class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks, id: :string do |t|
      t.string :name, null: false
      t.references :album, type: :string, null: false, foreign_key: true
    end
  end
end
