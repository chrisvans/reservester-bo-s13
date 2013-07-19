class ReservationMailer < ActionMailer::Base

  include Resque::Mailer

  default :from => "reservester@gmail.com"

  def reservation_notice(reservation_id)
    @user_reservation = Reservation.find(reservation_id)
  	@user = @user_reservation.restaurant.user
  	@restaurant = @user_reservation.restaurant

  	mail(:to => "#{@user.username} <#{@user.email}>", :subject => "Reservation Made")
  end

  def reservation_accepted(reservation_id)
    @user_reservation = Reservation.unscoped.find(reservation_id)
  	@user = @user_reservation.restaurant.user
  	@restaurant = @user_reservation.restaurant

  	mail(:to => "<#{@user_reservation.email}>", :subject => "Reservation Accepted")
  end

end
