class ArtistsPost < ApplicationRecord
  validates :artist_id, presence: true
  validates :post_id, presence: true

  belongs_to :artist
  belongs_to :post
end
