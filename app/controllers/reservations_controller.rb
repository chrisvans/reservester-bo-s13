class ReservationsController < ApplicationController
  before_filter :require_restaurant_owner_match!, :except => :create
  
 
  def create
  	@restaurant = Restaurant.find params[:restaurant_id]
  	@reservation = @restaurant.reservations.build params[:reservation]

  	if @reservation.save
  	  redirect_to @restaurant, :notice => 'Your reservation has been created, yo'
  	else
  	  render 'restaurants/show'
  	 end
  end

  def destroy
  	@reservation = Reservation.find params[:id]
  	@reservation.destroy

  	redirect_to @reservation.restaurant
  end
end #end class
