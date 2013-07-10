class ReservationsController < ApplicationController
	#before_filter :require_restaurant_owner_match!, :except => :create

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@owner = Owner.find(@restaurant.owner_id)
		@reservation = @restaurant.reservations.create(params[:reservation])	
			if @reservation.save
				#email the owner!
				ReservationMailer.reservation_notification(@reservation).deliver
				flash[:notice] = "We saved your reservation and notified the restaurant!"
			
				redirect_to @restaurant
			else
				render ('restaurants/show')
			end
	end

	
	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to :back , :notice => "Deleted reservation for #{@reservation.guestname}"
	end



end
