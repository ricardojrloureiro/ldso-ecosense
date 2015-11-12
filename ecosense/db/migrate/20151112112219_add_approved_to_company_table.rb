class AddApprovedToCompanyTable < ActiveRecord::Migration
  def change
    add_column :companies, :approved, :boolean, default: 0
  end
end
