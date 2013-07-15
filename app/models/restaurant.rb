class Restaurant < ActiveRecord::Base
  resourcify
  attr_accessible :address, :description, :name, :phone, :image, :image_cache, :menu, :menu_cache, :latitude, :longitude, :owner
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :owner, presence: true

  geocoded_by :address
  after_validation :geocode

  belongs_to :owner

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader
end
