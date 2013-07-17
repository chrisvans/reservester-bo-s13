class OwnersController < ApplicationController

	def dashboard
		@restaurant = Owner.find(current_owner.id).restaurants
	end

end
