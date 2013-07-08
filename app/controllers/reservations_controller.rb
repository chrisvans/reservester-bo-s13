class ReservationsController < ApplicationController
	

	def index
		@reservations = Reservation.all
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	# def create
	# 	@reservation = @restaurant.reservation.new(params[:reservation])

	# 	respond_to do |format|
	# 		if @reservation.save
	# 			format.html  { redirect_to(@reservation,
 #                    :notice => 'Reservation was successfully created.') }
	# 			format.json  { render :json => @reservation,
 #                    :status => :created, :location => @reservation}
 #            else
	# 		    format.html  { render :action => "new" }
	# 		    format.json  { render :json => @reservation.errors,
	# 		                    :status => :unprocessable_entity }
	# 		end
	# 	end
	# end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update_attributes(params[:reservation])
      	 redirect_to(@restaurant, :notice => 'Reservation was successfully updated.')
    	else render :action => "edit" 
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurants_path
	end

end
