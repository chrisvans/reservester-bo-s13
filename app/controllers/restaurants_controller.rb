class RestaurantsController < ApplicationController

	before_filter :authenticate_owner!, :only => [:new, :create, :edit, :update, :destroy]

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
		@restaurant = Restaurant.new(params[:restaurant])

		respond_to do |format|
			if @restaurant.save
				format.html  { redirect_to(@restaurant,
                    :notice => 'Restaurant was successfully created.') }
				format.json  { render :json => @restaurant,
                    :status => :created, :location => @restaurant }
            else
			    format.html  { render :action => "new" }
			    format.json  { render :json => @restaurant.errors,
			                    :status => :unprocessable_entity }
			end
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes(params[:restaurant])
      	 redirect_to(@restaurant, :notice => 'Restaurant was successfully updated.')
    	else render :action => "edit" 
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

end
