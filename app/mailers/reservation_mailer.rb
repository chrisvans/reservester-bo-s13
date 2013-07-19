class ReservationMailer < ActionMailer::Base
  	default from: "margaret@scott.com"

	def reservation_notification(reservation)
		puts "hello I am the notification beginning"
		owner = reservation.restaurant.owner
		mail(:to => "#{owner.name} <#{owner.email}>", :subject => "Reservation Created")
		puts "hello I am the notification ending"
	end
end
