class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :pdf, :longitude, :latitude
  
  mount_uploader :photo, PhotoUploader
  mount_uploader :pdf, PdfUploader

  geocoded_by :address
  after_validation :geocode

  # validates :address, presence: true
  # validates :description, presence: true
  # validates :phone, presence: true
  # validates :photo, presence: true
  # validates :photo_cache, presence: true

end
