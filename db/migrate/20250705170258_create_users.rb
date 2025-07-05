class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :clerk_id, null: false
      t.timestamps
    end

    add_index :users, :clerk_id, unique: true
  end
end
