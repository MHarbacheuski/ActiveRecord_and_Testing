class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :text_post
      t.column :status, :integer, default: 0
      t.timestamps
    end
  end
end
