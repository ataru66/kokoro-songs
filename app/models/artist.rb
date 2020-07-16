class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :posts, through: :artists_posts
  has_many :artists_posts
  has_many :albums, through: :artists_albums
  has_many :artists_albums
  has_many :tracks
end
