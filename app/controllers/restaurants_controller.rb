class RestaurantsController < ApplicationController

	before_filter :authenticate_owner!, except: [:index, :show]
	# before_filter :require_restaurant_owner_match! [:create, :edit ]
	def index 
		@restaurants  = Restaurant.all
	end

	def show 
		@restaurant = Restaurant.find(params[:id])

		@reservation = Reservation.new
		@reservation.restaurant = @restaurant
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant])
		@restaurant.owner = current_owner
		if @restaurant.save
			redirect_to @restaurant
		else 
			render 'new'
		end 
	end

	def update
		@restaurant = Restaurant.find(params[:id]) 
		
		if current_owner = @restaurant.owner 	
			if @restaurant.update_attributes(params[:restaurant]) 
				redirect_to @restaurant
			else
				render 'edit'
			end
		end
	end 

	def edit
		@restaurant = Restaurant.find(params[:id])
		if current_owner != @restaurant.owner
			render 'show'
		end 
	end 

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path
	end

end 

# private 
# 	def restaurant_params
# 		params.require(:restaurant).permit(:name, :text)
# 	end
# end		

