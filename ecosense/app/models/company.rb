class Company < ActiveRecord::Base
  has_many :companies_categorizations
  has_many :categories, through: :companies_categorizations
end