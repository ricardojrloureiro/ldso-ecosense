class CreateCategoriesCompanies < ActiveRecord::Migration
  def change
    create_table :categories_companies do |t|
      t.integer :category_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
