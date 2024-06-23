FactoryBot.define do
  factory :passage do
    from { create(:stage) }
    to { create(:stage) }
    name { 'a winding tunnel' }
    direction { Faker::Lorem.paragraph }
  end
end
