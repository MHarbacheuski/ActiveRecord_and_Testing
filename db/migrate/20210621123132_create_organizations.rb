class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.timestamps
    end
    add_index :organizations, :name
    add_index :organizations, :user_id
    add_index :organizations, :post_id
  end
end
