FactoryBot.define do
  factory :prop do
    item { create(:item) }
    slotted { create(:actor) }
    name { Faker::Name.name }
    slots { ["test", "test"] }
  end
end
