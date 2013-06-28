class RestaurantsController < ApplicationController
  def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		@restaurant = Restaurant.new.(params[:restaurant])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
	end

end
