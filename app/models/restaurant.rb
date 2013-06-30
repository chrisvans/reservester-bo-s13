class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache
  validates_presence_of :name, :phone

  mount_uploader :photo, PhotoUploader

end
