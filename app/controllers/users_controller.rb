class UsersController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
		@restuarants = current_user.restaurants
	end
end
