class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache
  belongs_to :owner
  mount_uploader :photo, PhotoUploader

  validates_presence_of :name
end