class MailWorker
	@queue = :mail_queue

	def self.perform(worker_information)
		reservation = Reservation.find(worker_information)
		owner = reservation.restaurant.owner
		restaurant = reservation.restaurant
		mail_information = [owner, reservation, restaurant]

		ReservationMailer.reservation_accepted(mail_information).deliver
    end

end