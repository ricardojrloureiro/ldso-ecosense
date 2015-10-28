class Company < User
  self.table_name = 'companies'

  has_many :categories
end