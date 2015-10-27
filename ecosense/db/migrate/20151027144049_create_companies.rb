class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.string :phone_number
      t.string :mobile_number

      t.string :address
      t.text :about

      t.text :logo

      t.timestamps null: false
    end
  end
end
