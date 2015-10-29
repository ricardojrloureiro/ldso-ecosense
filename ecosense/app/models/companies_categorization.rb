class CompaniesCategorization < ActiveRecord::Base
  self.table_name = 'companies_categories'
  belongs_to :company
  belongs_to :category
end