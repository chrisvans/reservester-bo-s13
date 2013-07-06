class Reservation < ActiveRecord::Base
  attr_accessible :guestname, :guestemail, :guestnumber, :message, :reserve_on,
  				  :reservationdate, :reservationtime, :restaurant_id

  belongs_to :restaurant


end
