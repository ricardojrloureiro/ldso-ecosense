class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  has_many :likes
end
