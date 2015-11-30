class Post < ActiveRecord::Base

  #model relationships
  belongs_to :user
  belongs_to :company

  has_many :likes
  has_many :comments
  has_many :shares

  #methods

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
