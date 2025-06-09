class CreateMetadata < ActiveRecord::Migration[8.0]
  def change
    create_table :metadata do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
