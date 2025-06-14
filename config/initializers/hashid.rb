Hashid::Rails.configure do |config|
  # Configure the salt for Hashids. Override with HASHID_SALT env var.
  config.salt = HASHID_SALT
  config.min_hash_length = 8
end
