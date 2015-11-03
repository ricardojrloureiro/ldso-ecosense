class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :teaser
      t.string :title

      t.text :content
      t.timestamps null: false
    end
  end
end
