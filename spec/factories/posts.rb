require 'faker'

FactoryBot.define do
  factory :post do
    content { Faker::Games::Zelda.item }
    artist_id { "000000" }
    song_id { "999999" }
    artist { Faker::Music.band }
    song { Faker::Game.title }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
