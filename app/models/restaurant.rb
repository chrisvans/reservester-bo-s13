class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :image_cache, :menu, :menu_cache, :latitude, :longitude
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader
end
