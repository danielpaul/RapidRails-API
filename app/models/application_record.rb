class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Generate and resolve HashIDs for all models inheriting from ApplicationRecord
  include Hashid::Rails
end
