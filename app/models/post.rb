class Post < ApplicationRecord
  validates :content, presence: true
  validates :user, presence: true
  validates :album_id, presence: true
  validates :track_id, presence: true

  belongs_to :user
  has_many :artists, through: :artists_posts
  has_many :artists_posts
  belongs_to :album
  belongs_to :track
end
