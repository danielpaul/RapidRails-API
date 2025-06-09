# == Schema Information
#
# Table name: metadata
#
#  id         :bigint           not null, primary key
#  key        :string
#  value      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :metadata do
    key { Faker::Lorem.unique.word }
    value { Faker::Lorem.sentence }
  end
end
