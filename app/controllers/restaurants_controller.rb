class RestaurantsController < ApplicationController


before_filter :authenticate_owner!, except: [:index, :show]

	def index
		@restaurant = Restaurant.order("created_at DESC")
	end


	def new
		@restaurant = Restaurant.new(params[:restaurant])		
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		@reservation = Reservation.new
    	@reservation.restaurant = @restaurant
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end


	def create
		@restaurant = current_owner.restaurants.create(params[:restaurant])
			if @restaurant.save
				flash[:notice] = "We saved your restaurant entry"
				redirect_to(:action => 'index')
			else
				render ('new')
			end
	end

	def update
		@restaurant = current_owner.restaurants.find(params[:id])
		if @restaurant.update_attributes(params[:restaurant])
			flash[:notice] = "We updated your entry"
			redirect_to(:action => 'index')
		else
			flash[:notice] = "Something went terribly wrong and we couldn't update your entry"
			render ('edit')
		end
	end

	def delete
		@restaurant = Restaurant.find(params[:id]).destroy
		flash[:notice] = "You entry has been deleted"
		redirect_to(:action => 'index')
	end


end
