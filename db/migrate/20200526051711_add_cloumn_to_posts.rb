class AddCloumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :artist, :string, null: false
    add_column :posts, :song, :string, null: false
  end
end
