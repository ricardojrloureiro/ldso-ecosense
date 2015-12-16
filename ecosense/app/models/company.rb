class Company < ActiveRecord::Base
  has_many :companies_categorizations
  has_many :categories, through: :companies_categorizations
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }

  validates :company_number, format: { with: /\A(\+\d{3})?\d{9}\z/, message: "must be 9 digits long with optional prefix" },
            allow_blank: true

  validates :about, length: { minimum: 15, maximum: 255 },
            allow_blank: true

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "http://www.caxtoneditorial.co.uk/en/wp-content/uploads/2012/02/User.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.get_top_companies
    Company.all.order(categories_count: :desc).limit(5)
  end

end