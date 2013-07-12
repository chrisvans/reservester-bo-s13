class ReservationMailer < ActionMailer::Base
  default from: "bathrobeman@bathrobeman.com"

  def reservation_confirmation(owner, restaurant, reservation)
  	@owner = owner
  	@restaurant = restaurant
  	@reservation = reservation
  	mail(:to => @owner.email, :subject => "You Have a New Reservation")
  end

end
