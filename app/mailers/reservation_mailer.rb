class ReservationMailer < ActionMailer::Base
  default from: "luis.m.beccaria@gmail.com"

  def reservation_notification(reservation)
  	@reservation = reservation
  	mail(:to => reservation.email, :subject => "Your Reservation")
  end
end
