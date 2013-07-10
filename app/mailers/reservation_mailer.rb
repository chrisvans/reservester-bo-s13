class ReservationMailer < ActionMailer::Base
  default from: "reservester@reservester.com"

  def reservation_notification(owner,reservation)
  	@owner = owner
  	@reservation = reservation
  	mail(to: @owner.email, subject: "New Reservation at #{@reservation.restaurant.name}")
  end
end
