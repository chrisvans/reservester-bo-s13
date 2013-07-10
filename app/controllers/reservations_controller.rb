class ReservationsController < ApplicationController
	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
        @reservation = Restaurant.find(params[:restaurant_id]).reservations.new
        
        # @reservation.r_time = params[:r_time]
        # @reservation.anon_name = params[:anon_name]
        # @reservation.reserved_on = params[:reserved_on]

        if @reservation.save
          redirect_to root_url, notice: 'Reservation was successfully created.'
        else
          render action: "new", notice: 'There was an error.'
        end

    end

    def show
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

end
