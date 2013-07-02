class Location < ActiveRecord::Base
  attr_accessible :longitude, :latitude

  after_validation :geocode


end
