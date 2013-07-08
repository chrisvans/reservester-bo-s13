class ReservationMailer < ActionMailer::Base
  default from: "luis.m.beccaria@gmail.com"

  def reservation_notification(reservation)
  	@reservation = reservation
  	@owneremail = reservation.restaurant.owner.email
  	mail(:to => @owneremail, :subject => "You have a new reservation")
  end
end
