class ReservationsController < ApplicationController
	before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

	def require_restaurant_owner_match!
    	@restaurant = Restaurant.find(params[:id])

    	unless @restaurant.owner == current_owner
      		render "unauthorized", :status => :unauthorized
    	end
	end
	
end
