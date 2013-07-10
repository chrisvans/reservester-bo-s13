class OwnersController < ApplicationController
	before_filter :authenticate_owner!

	def dashboard
		@restaurants = current_owner.restaurants
	end
end
