class Restaurant < ActiveRecord::Base
  attr_accessible :name, :description, :street, :streetnumber, :city, 
  					:zipcode, :state, :country, :phonenumber, :image, :remote_image_url,
  					:menue, :longitude, :latitude


  mount_uploader :image, ImageUploader
  mount_uploader :menue, MenueUploader

	geocoded_by :zipcode
	after_validation :geocode

	def address
	  [street, streetnumber, city, state, zipcode, country].compact.join(', ')
	end

	


end
