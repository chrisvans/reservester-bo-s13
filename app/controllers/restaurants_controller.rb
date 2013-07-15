class RestaurantsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_owner!, :except => [:index, :show]
  #before_filter :check_ownership!, :only => [:edit, :update, :destroy]
  #
  #def check_ownership
  #  @restaurant = Restaurant.find(params[:id])
  #  if owner_signed_in? && current_owner.id == @restaurant.owner_id
  #
  #  else
  #    redirect_to root_path, :notice => "You must own this restaurant to change or modify it!"
  #    return false
  #  end
  #end



	def new
    #@owner = Owner.find(params[:owner_id])
    #@owner = current_owner
		@restaurant = Restaurant.new
	end

	def create
    #@owner = Owner.find(params[:owner_id])

		@restaurant = Restaurant.new(params[:restaurant])
    @restaurant.owner = current_owner

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def index
		@restaurants = Restaurant.all
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes(params[:restaurant])
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path
	end

	
end
