class ReservationMailer < ActionMailer::Base

  default :from => "reservester@gmail.com"

  def reservation_notice(information)
  	@owner = information[0]
  	@user_reservation = information[1]
  	@restaurant = information[2]

  	mail(:to => "#{@owner.username} <#{@owner.email}>", :subject => "Reservation Made")
  end

  def reservation_accepted(information)
    @owner = information[0]
    @user_reservation = information[1]
    @restaurant = information[2]

  	mail(:to => "#{@user_reservation.email} <%{@user_reservation.email}>", :subject => "Reservation Accepted")
  end
  
end
