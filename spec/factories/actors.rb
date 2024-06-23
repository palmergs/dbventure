# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    user { create(:user) }
    stage { create(:stage) }
    creature { create(:creature) }
    name { Faker::Name.name }
  end
end
