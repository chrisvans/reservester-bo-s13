class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone_number, :image

  validates :address, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :phone_number, :presence => true

  mount_uploader :image, ImageUploader
end
