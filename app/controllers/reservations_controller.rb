class ReservationsController < ApplicationController


	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new(params[:reservation])
		@reservation.restaurant = @restaurant


		if @reservation.save!
			redirect_to restaurants_path
			ReservationMailer.res(@restaurant.owner, @restaurant, @reservation).deliver
		else
			render restaurant_show_path
		end

	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.find(params[:id])

		if (@restaurant.owner_id != current_owner.id)
			redirect_to restaurants_path
			return 
		end

		@reservation.destroy

		redirect_to @restaurant
	end

end
