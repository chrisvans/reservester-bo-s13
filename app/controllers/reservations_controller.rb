class ReservationsController < ApplicationController
	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
 	    @restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
        @restaurant = Restaurant.find params[:restaurant_id]
        @reservation = @restaurant.reservations.build params[:reservation]

        @information = [@restaurant.owner, @reservation, @restaurant]
        if @reservation.save
          ReservationMailer.reservation_notice(@information).deliver
          redirect_to @restaurant, notice: 'Reservation was successfully created.'
        else
          render 'restaurants/show'
        end
    end

    def destroy
	    @reservation = Reservation.find params[:id]
	    @reservation.destroy

	    redirect_to @reservation.restaurant
     end

  def edit
    @reservation = Reservation.find params[:id]
  end
    
end
