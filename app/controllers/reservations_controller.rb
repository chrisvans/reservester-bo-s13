class ReservationsController < ApplicationController

  before_filter :authenticate_owner!, :only => [ :edit, :destroy ]

	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
 	    @restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
        @restaurant = Restaurant.find params[:restaurant_id]

        time_format = params[:reservation][:date_time].to_s
        time_format[13] = ":"
        time_format = time_format.to_datetime
        params[:reservation][:date_time] = time_format

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
	    @restaurant = @reservation.restaurant
      @safe_reservation = @reservation
      @information = [@reservation.restaurant.owner, @safe_reservation, @reservation.restaurant]
      puts @information
      if @reservation.destroy
        ReservationMailer.reservation_accepted(@information).deliver
        redirect_to @restaurant, notice: 'Reservation confirmation sent.'
      else
	      redirect_to @restaurant
      end

     end

  def edit
    @reservation = Reservation.find params[:id]
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def update
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @reservation.update_attributes(params[:reservation])
      redirect_to @restaurant, notice: 'Reservation was successfully updated.'
    else
      render action: "edit"
    end
  end

end
