require 'faker'

FactoryBot.define do
  factory :post do
    content { Faker::Games::Zelda.item }
    album_id { "0zoEfi1Tq2OXlhD2cSClWW" }
    track_id { "1SdwlHsv8bWHbAlIw5Jfgo" }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
