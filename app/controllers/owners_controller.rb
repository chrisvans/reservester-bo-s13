class OwnersController < ApplicationController

	def dashboard
		@dashboard = Restaurant.find(params[:id])

	end


end
