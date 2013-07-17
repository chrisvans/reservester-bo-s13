class OwnersController < ApplicationController

before_filter :authenticate_owner!

def dashboard
	if @owner = current_owner
		@restaurants = @owner.restaurants.all
		# @reservations = []

		# @restaurants.each do |restaurant|
				# restaurant.reservations.each do |reservation|
				# reservations << restaurant
			# end
		# send
	else 
		redirect_to root_path	
	end
end 

end
