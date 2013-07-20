class ReservationsController < ApplicationController
	before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

	
	
	def create
		puts "entered reservations create"
		current_restaurant = Restaurant.find params[:restaurant_id]
		@reservation = current_restaurant.reservations.build(params[:reservation])
		respond_to do |format|
			if @reservation.save
				#Send a reservation notification email to the restaurant's owner
				puts "beginning of action response"
				ReservationMailer.reservation_notification(@reservation).deliver
    			format.html  { redirect_to(current_restaurant,
    							:notice => 'Your reservation has been accepted. See you soon!') }
    			format.json  { render :json => @reservation,
    							:status => :created, :location => @reservation }
    			puts "end of action response"
      		else
        		format.html { render 'restaurant/show' }
        		format.json { render :json => current_restaurant.errors,
                      			:status => :unprocessable_entity }
    		end
    	end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy

		redirect_to @reservation.restaurant
	end

	private
	helper_method :current_restaurant
	def current_restaurant
		@current_restaurant ||= Reservation.find_by_id(params[:id]).restaurant
	end
end
