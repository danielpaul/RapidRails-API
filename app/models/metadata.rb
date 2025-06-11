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
class Metadata < ApplicationRecord
  include Discard::Model

  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  def self.[](key)
    find_by(key: key)&.value
  end
end
