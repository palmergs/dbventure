# frozen_string_literal: true

FactoryBot.define do
  factory :stage do
    name { 'A large cave' }
    description { Faker::Lorem.sentence }
  end
end
