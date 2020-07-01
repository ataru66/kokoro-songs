class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :posts, through: :artists_posts
  has_many :artists_posts
  has_many :albums
  has_many :tracks
end
