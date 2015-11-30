class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  has_many :likes
  has_many :comments

  validates :teaser, length: { minimum: 5, maximum: 255 },
                    presence: true

  validates :title, length: { minimum: 5, maximum: 255},
                    presence: true

  validates :content, length: { minimum: 15 },
                    presence: true
end
