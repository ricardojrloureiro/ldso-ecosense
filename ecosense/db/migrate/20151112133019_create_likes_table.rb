class CreateLikesTable < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.integer :user_id
     	t.integer :post_id
    end
  end
end
