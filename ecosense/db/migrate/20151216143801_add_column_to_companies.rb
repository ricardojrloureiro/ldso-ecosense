class AddColumnToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :categories_count, :integer, default: 0

    Company.find_each do |company|
      company.categories_count = company.categories.count
      if !company.address
        company.address = 'na'
      end
      company.save!
    end
  end

end
