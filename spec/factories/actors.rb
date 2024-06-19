FactoryBot.define do
  factory :actor do
    stage { create(:stage) }
    creature { create(:creature) }
    name { Faker::Name.name }
  end
end
