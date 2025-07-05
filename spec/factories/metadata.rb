# == Schema Information
#
# Table name: metadata
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  key          :string
#  value        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_metadata_on_discarded_at  (discarded_at)
#
FactoryBot.define do
  factory :metadata do
    key { Faker::Lorem.unique.word }
    value { Faker::Lorem.sentence }
  end
end
