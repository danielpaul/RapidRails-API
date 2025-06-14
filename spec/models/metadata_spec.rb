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
require 'rails_helper'

RSpec.describe Metadata, type: :model do
  subject { build(:metadata) }

  it { is_expected.to validate_presence_of(:key) }
  it { is_expected.to validate_uniqueness_of(:key) }
  it { is_expected.to validate_presence_of(:value) }

  describe '.[]' do
    let!(:metadata) { create(:metadata, key: 'site_name', value: 'RapidRails') }

    it 'returns the value for the given key' do
      expect(Metadata['site_name']).to eq('RapidRails')
    end

    it 'returns nil for missing keys' do
      expect(Metadata['missing']).to be_nil
    end
  end

  describe 'discard' do
    it 'sets discarded_at timestamp instead of deleting' do
      metadata = create(:metadata)
      metadata.discard
      expect(metadata.discarded_at).not_to be_nil
    end
  end

  describe 'hashid' do
    it 'uses hashid in to_param and find' do
      metadata = create(:metadata)
      hashid = metadata.to_param
      expect(hashid).to eq(metadata.hashid)
      expect(Metadata.find(hashid)).to eq(metadata)
    end
  end
end
