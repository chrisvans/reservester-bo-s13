class ReservationsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.create(params[:reservation])	
			if @reservation.save
				flash[:notice] = "We sent your reservation request!"
				render ('restaurants/show')
			else
				render ('restaurants/show')
			end
	end

	
	def delete

	end




end
