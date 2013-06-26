class RestaurantsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant])

		@restaurant.save
		redirect_to @restaurant

	end

	def edit
	end

	def update
	end

	def destroy
	end

end
