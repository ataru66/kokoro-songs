class ArtistsTrack < ApplicationRecord
  validates :artist_id, presence: true
  validates :track_id, presence: true

  belongs_to :artist
  belongs_to :track
end
