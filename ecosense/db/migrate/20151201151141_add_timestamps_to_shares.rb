class AddTimestampsToShares < ActiveRecord::Migration
  def change
    change_table :shares do |t|
      t.timestamps null: false
    end
  end
end
