class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def reservation_notification(reservation)
  	@reservation = reservation
  	@restaurant = @reservation.restaurant
  	@owner = @restaurant.owner

  	mail :to => @owner.email, subject: "New Reservation at #{@reservation.restaurant.name}"

  end 

end
