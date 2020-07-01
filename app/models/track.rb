class Track < ApplicationRecord
  validates :name, presence: true
  validates :album_id, presence: true

  has_many :posts
  has_many :artists
  belongs_to :album
end
