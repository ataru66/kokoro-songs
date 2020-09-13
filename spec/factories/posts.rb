require 'faker'

FactoryBot.define do
  factory :post do
    content { Faker::Games::Zelda.item }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
