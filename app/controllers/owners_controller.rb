class OwnersController < ApplicationController

	#prevent not signed-in users to see the dashboard
	before_filter :authenticate_owner!

	def dashboard
		#run a loop to count the reservation for each restaurant
		@restaurant = Restaurant.last
		# sum up the total reservations for each restaurant
		@count = @restaurant.reservations.count

		@restaurants = current_owner.restaurants.order("created_at DESC")
		

		#restaurant = @restaurant
		#@reservation = restaurant.reservation
		#@reservation.restaurant = @restaurant
	end


end


