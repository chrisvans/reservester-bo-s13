class Restaurant < ActiveRecord::Base
  attr_accessible :name, :description, :street, :streetnumber, :city, 
  					:zipcode, :state, :country, :phonenumber, :image, :remote_image_url,
  					:menue


  mount_uploader :image, ImageUploader
  mount_uploader :menue, MenueUploader

	geocoded_by :zipcode

	def address
	  [street, streetnumber, city, state, zipcode, country].compact.join(', ')
	end

	


end
