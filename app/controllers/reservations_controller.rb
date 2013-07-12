class ReservationsController < ApplicationController
	
	before_filter :authenticate_owner!, :only => [:destroy]
	# @restaurant = Restaurant.find(params[:restaurant_id])
	# would like to put this up here some how

	def index
		@reservations = Reservation.all
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new
	end

	def show
		@restaurant = Restaurant.find(params[:restaurant_id])
		if current_owner && current_owner.id = @restaurant.owner_id
		@reservation = Reservation.find(params[:id])
		else redirect_to restaurants_path
		end

	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(params[:reservation])
		@owner = @restaurant.owner

			if @reservation.save
				ReservationMailer.reservation_confirmation(@owner, @restaurant, @reservation).deliver
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
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurant_path(@restaurant)
	end

end
