require 'faker'

FactoryBot.define do
  factory :post do
    content { Faker::Games::Zelda.item }
    artist_id { "5Vo1hnCRmCM6M4thZCInCj" }
    song_id { "58dxGXavrcagRqA58fNB0Z" }
    artist { Faker::Music.band }
    song { Faker::Game.title }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
