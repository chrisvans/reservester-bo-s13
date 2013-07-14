class Restaurant < ActiveRecord::Base


  attr_accessible :name, :description, :street, :streetnumber, :city, 
  					:zipcode, :state, :country, :phonenumber, :image, :remote_image_url,
  					:menue, :longitude, :latitude, :category_ids

	has_many :reservations, :dependent => :destroy
	belongs_to :owner
	has_and_belongs_to_many :categories

	validates :name, presence: true
	validates :owner, presence: true


  mount_uploader :image, ImageUploader
  mount_uploader :menue, MenueUploader

	geocoded_by :address
	after_validation :geocode

	def address
	  [streetnumber, street, city, state, zipcode, country].compact.join(', ')
	end


	def pretty_string
		return "#{self.name} - #{self.street}"
	end




end
