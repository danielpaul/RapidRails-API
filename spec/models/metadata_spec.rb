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
end
