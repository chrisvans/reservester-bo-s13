class Restaurant < ActiveRecord::Base
  attr_accessible :remote_image_url, :image, :city, :country, :description, :phonenumber, :restaurant, :state, :street1, :street2, :zipcode
  validates :restaurant, presence: true
  validates :owner, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :owner
  has_many :reservations
  accepts_nested_attributes_for :reservations
end
