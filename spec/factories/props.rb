# frozen_string_literal: true

FactoryBot.define do
  factory :prop do
    item { create(:item) }
    slotted { create(:actor) }
    name { Faker::Name.name }
    slots { %w[test test] }
  end
end
