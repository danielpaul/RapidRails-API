# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  clerk_id   :string           not null
#
# Indexes
#
#  index_users_on_clerk_id  (clerk_id) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to validate_presence_of(:clerk_id) }
  it { is_expected.to validate_uniqueness_of(:clerk_id) }
end