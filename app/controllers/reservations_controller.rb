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

	
	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		flash[:notice] = "Reservation Deleted!"
		redirect_to({:controller => 'restaurants', :action => 'show'}, :id => @restaurant.id)
	end



end
