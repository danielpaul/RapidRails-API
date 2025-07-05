# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  clerk_id   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_clerk_id  (clerk_id) UNIQUE
#
FactoryBot.define do
  factory :user do
    clerk_id { "user_#{SecureRandom.hex(10)}" }
  end
end 