class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :album, type: :string, foreign_key: true, null: false
    add_reference :posts, :track, type: :string, foreign_key: true, null: false
  end
end
