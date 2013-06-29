class Restaurant < ActiveRecord::Base

  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache

  has_attached_file :photo
  has_attached_file :pdf
end

 

