class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :state
      t.integer :organization_id
      t.timestamps
    end
    add_index :users, :name
    add_index :users, :state
    add_index :users, :post_id
  end
end
