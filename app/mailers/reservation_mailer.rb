class ReservationMailer < ActionMailer::Base
  	default from: "margaret@scott.com"

	def reservation_notification(reservation)
		owner = reservation.restaurant.owner
		mail(:to => "#{owner.name} <#{owner.email}>", :subject => "Reservation Created")
	end
end
