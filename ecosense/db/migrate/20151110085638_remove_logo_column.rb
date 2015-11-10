class RemoveLogoColumn < ActiveRecord::Migration
  def change
    remove_column :users, :logo
    remove_column :companies, :logo
  end
end
