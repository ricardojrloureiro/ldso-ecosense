class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  has_many :likes
  has_many :comments
end
