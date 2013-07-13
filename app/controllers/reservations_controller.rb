class ReservationsController < ApplicationController
	before_filter :require_restaurant_owner_match!, :except => :create

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(params[:reservation])

		if @reservation.save
			ReservationMailer.reservation_notification(@reservation).deliver
      		redirect_to @restaurant, notice: 'Reservation was successfully created.'
    	else
      		render 'restaurant/show'
    	end
	end

	def show
	end

	def destroy
    	@reservation = Reservation.find(params[:id])
    	@reservation.destroy

    	redirect_to @reservation.restaurant
	end
end
