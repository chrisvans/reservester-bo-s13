class RestaurantsController < ApplicationController

	before_filter :authenticate_owner!,
    :only => [:new, :create]


	def new
		@restaurant = Restaurant.new
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])

		if (@restaurant.owner_id != current_owner.id)
			redirect_to restaurants_path
			return 
		end

		@restaurant.destroy

		redirect_to restaurants_path
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		if (@restaurant.owner_id != current_owner.id)
			redirect_to restaurants_path
			return 
		end

	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@image = ImageUploader.new

	end


	def create
		@restaurant = Restaurant.new(params[:restaurant])
		@restaurant.owner_id = current_owner.id

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def index
		@restaurant = Restaurant.all
	end 

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(params[:restaurant])
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	# private
	# 	def post_params
	# 		params.require(:post).permit(:name, :description, :address, :phone_number)
	# 	end


end
