class UsersController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
		@restuarants = current_user.restaurants
	end

	def owner?
		if current_user.role == 'owner'
			then true
		end
	end

	def patron?
		if current_user.role == 'patron'
			then true
		end
	end
end
