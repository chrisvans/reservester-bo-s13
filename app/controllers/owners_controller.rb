class OwnersController < ApplicationController

	#prevent not signed-in users to see the dashboard
	before_filter :authenticate_owner!

	def dashboard

		
		#run a loop to count the reservation for each restaurant
		@restaurant = current_owner.restaurants
		

		@restaurants = current_owner.restaurants.order("created_at DESC")
		
		# sum up the total reservations for each restaurant
		#@count = @restaurant.reservations.count

		#restaurant = @restaurant
		#@reservation = restaurant.reservation
		#@reservation.restaurant = @restaurant
	end


end


