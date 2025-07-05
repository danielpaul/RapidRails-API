class CreateOrgs < ActiveRecord::Migration[8.0]
  def change
    create_table :orgs do |t|
      t.string :clerk_org_id

      t.timestamps
    end
    add_index :orgs, :clerk_org_id
  end
end
