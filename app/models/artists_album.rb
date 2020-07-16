class ArtistsAlbum < ApplicationRecord
  validates :artist_id, presence: true
  validates :album_id, presence: true

  belongs_to :artist
  belongs_to :album
end
