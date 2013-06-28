class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all

		respond_to do |format|
			format.html #index.html.erb
			format.json { render :json => @restaurants }
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		respond_to do |format|
    		format.html  # show.html.erb
    		format.json  { render :json => @restaurant }
    	end
		
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant])

		#Had to remove the API here, it made
		#the app look for a create template.

		#respond_to do |format|
    	#	format.html  # new.html.erb
    	#	format.json  { render :json => @restaurant }
  		#end

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		
		respond_to do |format|
    		if @restaurant.update_attributes(params[:restaurant])
      			format.html  { redirect_to(@restaurant,
                    :notice => 'Restaurant was successfully updated.') }
      			format.json  { head :no_content }
    		else
      			format.html  { render :action => "edit" }
      			format.json  { render :json => @restaurant.errors,
                    :status => :unprocessable_entity }
    		end
    	end
  	end
	
	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		respond_to do |format|
			format.html { redirect_to restaurants_url }
			format.json { head :no_content }
		end
	end

end
