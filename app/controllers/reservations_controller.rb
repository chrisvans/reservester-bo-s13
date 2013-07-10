class ReservationsController < ApplicationController
	before_filter :require_ownership, :except => :create

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		# @reservation = @restaurant.reservations.build(params[:reservation]) # will contain an unvalidated reservation
		@reservation = Reservation.new(params[:reservation])
		@reservation.restaurant = @restaurant

		if @reservation.save
			ReservationMailer.reservation_notification(current_owner,@reservation).deliver
			redirect_to @restaurant, :notice => "Your reservation was successful!"
		else
			# @restaurant.reload # get rid of unvalidated reservations
			render 'restaurants/show'
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy

		redirect_to @reservation.restaurant
	end

end
