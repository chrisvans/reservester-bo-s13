class OwnersController < ApplicationController


	def dashboard
		@restaurant = current_owner.restaurants.order("created_at DESC")
		

		#restaurant = @restaurant
		#@reservation = restaurant.reservation
		#@reservation.restaurant = @restaurant
	end


end


