class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :booking_time,  :restaurant_id #used to be :restaurant_name

  belongs_to :restaurant

  validates :booking_time, :presence => true
  validates :email, :presence => true, :email => true
end
