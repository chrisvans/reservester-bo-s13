class ReservationMailer < ActionMailer::Base

  include Resque::Mailer

  default :from => "reservester@gmail.com"

  def reservation_notice(reservation_id)
    @user_reservation = Reservation.find(reservation_id)
  	@owner = @user_reservation.restaurant.owner
  	@restaurant = @user_reservation.restaurant

  	mail(:to => "#{@owner.username} <#{@owner.email}>", :subject => "Reservation Made")
  end

  def reservation_accepted(reservation_id)
    @user_reservation = Reservation.unscoped.find(reservation_id)
  	@owner = @user_reservation.restaurant.owner
  	@restaurant = @user_reservation.restaurant

  	mail(:to => "<#{@user_reservation.email}>", :subject => "Reservation Accepted")
  end

end
