class Post < ApplicationRecord
  validates :content, presence: true, null: false
  validates :artist_id, presence: true, null: false
  validates :song_id, presence: true, null: false
  validates :artist, presence: true, null: false
  validates :song, presence: true, null: false
  belongs_to :user
end
