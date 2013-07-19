class ReservationsController < ApplicationController

  before_filter :authenticate_user!, :only => [ :edit, :destroy ]

	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
 	  @restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
    @restaurant = Restaurant.find params[:restaurant_id]

    @reservation = @restaurant.reservations.build params[:reservation]

    if @reservation.save
      ReservationMailer.reservation_notice(@reservation.id).deliver
      redirect_to @restaurant, notice: 'Reservation was successfully created.'
    else
      render 'restaurants/show'
    end

  end

  def destroy
    @reservation = Reservation.find params[:id]
    @restaurant = @reservation.restaurant
      
    ReservationMailer.reservation_accepted(@reservation.id).deliver

    @reservation.update_attribute(:deleted, true)
    redirect_to @restaurant, notice: 'Reservation confirmation sent.'

  end

  def edit
    @reservation = Reservation.find params[:id]
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def update

    # if params[:state]
    #   @reservation.send("change_to_#{params[:state]}")
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @reservation.update_attributes(params[:reservation])
      redirect_to @restaurant, notice: 'Reservation was successfully updated.'
    else
      render action: "edit"
    end

  end

end
