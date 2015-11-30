class AddCoordinatesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :double, :null => true
    add_column :posts, :longitude, :double, :null => true
  end
end
