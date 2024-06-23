# frozen_string_literal: true

FactoryBot.define do
  factory :creature do
    name { Faker::Fantasy::Tolkien.race }
    description { Faker::Lorem.paragraph }
  end
end
