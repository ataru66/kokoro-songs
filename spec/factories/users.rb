require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Games::Overwatch.hero }
    sequence(:email) { Faker::Internet.email }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
end
