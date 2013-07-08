class Reservation < ActiveRecord::Base
  attr_accessible :guestname, :guestemail, :guestnumber, :message, :reserve_on,
  				  :reservationdate, :reservationtime, :restaurant_id

  belongs_to :restaurant

  validates_presence_of :guestname, :guestemail

end
