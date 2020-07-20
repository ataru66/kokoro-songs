class Album < ApplicationRecord
  validates :name, presence: true

  has_many :posts
  has_many :artists, through: :artists_albums
  has_many :artists_albums
  has_many :tracks
end
