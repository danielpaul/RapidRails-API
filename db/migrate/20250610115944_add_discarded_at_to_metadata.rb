class AddDiscardedAtToMetadata < ActiveRecord::Migration[8.0]
  def change
    add_column :metadata, :discarded_at, :datetime
    add_index :metadata, :discarded_at
  end
end
