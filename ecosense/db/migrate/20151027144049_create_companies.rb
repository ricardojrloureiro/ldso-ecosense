class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name
      t.string :company_number
      t.string :address
      t.text :about
      t.text :logo
      t.timestamps null: false
    end
  end
end
