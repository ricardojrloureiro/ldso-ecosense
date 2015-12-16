class AddExtraUserInfo < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date, :null => true
    add_column :users, :residence, :string, :null => true
    add_column :users, :occupation, :string, :null => true
  end
end
