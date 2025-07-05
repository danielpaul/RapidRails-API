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
class Metadata < ApplicationRecord
  include Discard::Model

  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  def self.[](key)
    find_by(key: key)&.value
  end
end
