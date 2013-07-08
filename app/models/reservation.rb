class Reservation < ActiveRecord::Base
  attr_accessible :booking_time, :email, :message, :restaurant_name

  belongs_to :restaurant
end
