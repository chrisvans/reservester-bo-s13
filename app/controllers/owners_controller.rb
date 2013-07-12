class OwnersController < ApplicationController
	before_filter :authenticate_owner!

	def dashboard
		@restuarants = current_owner.restaurants
	end
end
