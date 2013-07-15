class Restaurant < ActiveRecord::Base
	has_attached_file :photo

  attr_accessible :address, :reservation, :description, :name, :phone, :photo, :photo_cache, :category_id

  has_many :reservations
  belongs_to :owner
  has_and_belongs_to_many :categories

  #allows project page to add items via checkboxes
  accepts_nested_attributes_for :categories
  

  

   validates :name, :owner, :presence => true
  
  
 
end

 