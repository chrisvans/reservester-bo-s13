class Restaurant < ActiveRecord::Base
  attr_accessible :city, :country, :description, :phonenumber, :restaurant, :state, :street1, :street2, :zipcode
end
