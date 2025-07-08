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
class User < ApplicationRecord
  validates :clerk_id, presence: true, uniqueness: true

  def clerk_user
    @clerk_user ||= fetch_clerk_user
  end

  def name
    return "User" unless clerk_user
    [clerk_user.first_name, clerk_user.last_name].compact.join(" ")
  end

  private

  def fetch_clerk_user
    Rails.cache.fetch("clerk_user/#{clerk_id}", expires_in: 1.hour) do
      Clerk::SDK.new(api_key: Rails.application.credentials.dig(:clerk, :api_key))
        .users
        .get_user(clerk_id)
    end
  rescue Clerk::Error => e
    Rails.logger.error("Failed to fetch Clerk user #{clerk_id}: #{e.message}")
    nil
  end
end 
