class ReservationMailer < ActionMailer::Base
  default from: "bathrobeman@bathrobeman.com"

  def reservation_confirmation(owner)
  	@owner = restaurant.owner
  	mail(:to => owner.email, :subject => "You Have a New Reservation")

end
