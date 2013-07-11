class ReservationMailer < ActionMailer::Base
  default from: "marco@gmail.com"


  def reservation_notification(reservation)
  	@reservation = reservation
  	@owner_email = reservation.restaurant.owner.email
  	mail(:to => @owner_email, :subject => 'New Table Reservation from Reservster')
  end

end
