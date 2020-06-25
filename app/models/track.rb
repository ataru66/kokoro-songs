class Track < ApplicationRecord
  validates :name, presence: true
  has_many :artists
  belongs_to :album
end
