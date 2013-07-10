class ReservationsController < ApplicationController
	
	before_filter :authenticate_owner!, :only => [:destroy]

	def index
		@reservations = Reservation.all
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(params[:reservation])

			if @reservation.save
 				redirect_to(restaurants_path, :notice => 'Reservation was successfully created.') 
            else
				render :action => "new"
			end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update_attributes(params[:reservation])
      	 redirect_to(@restaurant, :notice => 'Reservation was successfully updated.')
    	else render :action => "edit" 
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurants_path
	end

end
