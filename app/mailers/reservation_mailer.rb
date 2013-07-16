class ReservationMailer < ActionMailer::Base
  default from: "info@reservester.com"

  def reservation_notification(reservation)
  	@reservation = reservation
  	@owner_email = reservation.restaurant.owner.email
  	mail(:to => reservation.email, :subject => "Reservester Reservation for #{reservation.restaurant.name}")
  end
end
