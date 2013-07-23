class ReservationsController < ApplicationController
  #before_filter :require_restaurant_owner_match!, :except => :create
  
 
  def create
  	@restaurant = Restaurant.find params[:restaurant_id]
  	@reservation = @restaurant.reservations.build params[:reservation]

  	if @reservation.save
      ReservationMailer.reservation_notification(@reservation).deliver
  	  redirect_to @restaurant, :notice => 'Your reservation has been created, yo'
  	else
  	  render 'restaurants/show', :notice => 'Uh-oh. Reservation did not save.'
  	 end
  end

  def destroy

    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  	#@restaurant.reservation.destroy


  	#redirect_to restaurant_reservations_path(restaurant_id)
    redirect_to :back
  end
end #end class
