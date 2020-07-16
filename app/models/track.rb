class Track < ApplicationRecord
  validates :name, presence: true
  validates :album_id, presence: true

  has_many :posts
  has_many :artists, through: :artists_tracks
  has_many :artists_tracks
  belongs_to :album
end
