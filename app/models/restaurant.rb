class Restaurant < ActiveRecord::Base

	belongs_to :owner

  attr_accessible :address, :description, :name, :phone_number, :image, :remote_image_url
  validates :name, presence: true, length: { minimum: 2}
  validates :description, presence: true, length: { minimum: 5}
  validates :address, presence: true, length: { minimum: 5}
  validates :phone_number, presence: true, length: { minimum: 10}

  mount_uploader :image, ImageUploader

end
