class ReservationMailer < ActionMailer::Base
  default from: "bathrobeman@bathrobeman.com"

  def reservation_confirmation(user, restaurant, reservation)
  	@user = user
  	@restaurant = restaurant
  	@reservation = reservation
  	mail(:to => @user.email, :subject => "You Have a New Reservation")
  end

end
