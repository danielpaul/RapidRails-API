# == Schema Information
#
# Table name: orgs
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  clerk_org_id :string           not null
#
# Indexes
#
#  index_orgs_on_clerk_org_id  (clerk_org_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Org, type: :model do
  subject { build(:org) }

  it { is_expected.to validate_presence_of(:clerk_org_id) }
  it { is_expected.to validate_uniqueness_of(:clerk_org_id) }
end