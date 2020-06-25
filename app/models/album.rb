class Album < ApplicationRecord
  validates :name, presence: true
  has_many :artists
  has_many :tracks
end
