class Reservation < ActiveRecord::Base
  attr_accessible :email, :requested_datetime, :restaurant_id, :short_message
  belongs_to :restaurant
  validates_presence_of :email, :requested_datetime
end
