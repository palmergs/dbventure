FactoryBot.define do
  factory :stage do
    name { "A large cave" }
    description { Faker::Lorem.sentence }
  end
end
