# == Schema Information
#
# Table name: orgs
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  clerk_org_id :string
#
# Indexes
#
#  index_orgs_on_clerk_org_id  (clerk_org_id)
#
FactoryBot.define do
  factory :org do
    clerk_org_id { "org_#{SecureRandom.hex(10)}" }
  end
end 