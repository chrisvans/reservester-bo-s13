# class MailWorker
# 	@queue = :mail_queue

# 	def self.perform(worker_information)
# 		reservation = Reservation.find(worker_information)
# 		user = reservation.restaurant.user
# 		restaurant = reservation.restaurant
# 		mail_information = [user, reservation, restaurant]

# 		ReservationMailer.reservation_notice(mail_information).deliver
#     end

# end