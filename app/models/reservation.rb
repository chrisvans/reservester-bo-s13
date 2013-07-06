class Reservation < ActiveRecord::Base
  attr_accessible :guestname, :guestnumber, :reservationdate, :reservationtime

  belongs_to :restaurant
  

end
