class Category < ActiveRecord::Base
  self.table_name = 'categories'
  has_many :companies_categorizations

  has_many :companies, through: :companies_categorizations

  validates :name, length: { minimum: 2, maximum: 255 },
                    presence: true
end