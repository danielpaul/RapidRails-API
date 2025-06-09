FactoryBot.define do
  factory :metadata do
    key { Faker::Lorem.unique.word }
    value { Faker::Lorem.sentence }
  end
end
