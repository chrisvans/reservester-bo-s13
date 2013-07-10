class OwnersController < ApplicationController


	def dashboard
		@restaurant = current_owner.restaurants.order("created_at DESC")
	end


end
