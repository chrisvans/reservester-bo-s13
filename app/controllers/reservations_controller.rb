class ReservationsController < ApplicationController

	before_filter :authenticate_owner!, :except => [:create, :update]

	def index 
		@reservations = Reservation.all
	end



	def create 
		@restaurant = Restaurant.find params[:restaurant_id]
		@reservation = @restaurant.reservations.build params[:reservation]

		if @reservation.save
			redirect_to @restaurant, notice: "Your reservation has been created"
		else 
			render 'restaurants/show'
		end
	end

	def update
		@reservation = Reservation.find(params[:id])
		
		if @reservation.update_attributes(params[:restaurant])
			redirect_to @reservation
		else 
			render 'edit'
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@restaurant = @reservation.restaurant
		if @reservation.destroy
			redirect_to @restaurant, notice: "Reservation has been deleted"
		end
	end

end 

