class Metadata < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  def self.[](key)
    find_by(key: key)&.value
  end
end
