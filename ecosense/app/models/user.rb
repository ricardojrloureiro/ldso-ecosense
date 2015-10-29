class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :phone_number, format: { with: /\A(\+\d{3})?\d{9}\z/, message: "must be 9 digits long with optional prefix" },
                           allow_blank: true,
                           on: [:update]

  validates :mobile_number, format: { with: /\A(\+\d{3})?\d{9}\z/, message: "must be 9 digits long with optional prefix" },
                            allow_blank: true,
                            on: [:update]

  validates :about, length: { minimum: 15, maximum: 255 },
                    allow_blank: true,
                    on: [:update]

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end
