class ReservationsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(params[:reservation])

		if @reservation.save
			redirect_to @restaurant, :notice => "Your reservation was successful!"
		else
			@restaurant.reload
			render 'restaurants/show'
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy

		redirect_to @reservation.restaurant
	end

end
