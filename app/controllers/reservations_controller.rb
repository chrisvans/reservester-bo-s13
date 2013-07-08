class ReservationsController < ApplicationController
	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
		@reservations = Restaurant.find(params[:restaurant_id]).reservations.all
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
        @reservation = Restaurant.find(params[:restaurant_id]).reservations.new
        @reservation_check = Restaurant.find(params[:restaurant_id]).where(:r_time => params[:r_time])
        @reservation.r_time = params[:reservation][:r_time]
        #@reservation.taken = true
        @reservation.anon_name = params[:reservation][:anon_name]
        @reservation.reserved_on = params[:reservation][:reserved_on]
        if @reservation.save
          redirect_to root_url, notice: 'Reservation was successfully created.'
        else
          render action: "new", notice: 'There was an error.'
        end
    end
end
