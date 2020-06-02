class Post < ApplicationRecord
  validates :content, presence: true
  validates :artist_id, presence: true
  validates :song_id, presence: true
  validates :artist, presence: true
  validates :song, presence: true
  belongs_to :user
end
