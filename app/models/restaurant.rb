class Restaurant < ActiveRecord::Base
	has_attached_file :photo

  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache

  has_many :reservations
  belongs_to :owner

  

   validates :name, :owner, :presence => true
  
  
 
end

 