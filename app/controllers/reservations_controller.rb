class ReservationsController < ApplicationController
	before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

	def delete
		@reservations = Restaurant.find(params[:restaurant.id])
		render :json => {}
	end

end
