class CreateCategoriesCompanies < ActiveRecord::Migration
  def change
    create_table :companies_categories do |t|
      t.integer :category_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
