class RestaurantsController < ApplicationController

	before_filter :require_current_restaurant, :only => [:show, :edit, :update, :destroy]
	before_filter :authenticate_owner!, :except => [:index, :show]
	before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]



	def index
		@restaurants = Restaurant.all

		respond_to do |format|
			format.html #index.html.erb
			format.json { render :json => @restaurants }
		end
	end

	def show

    @reservation = Reservation.new
    @reservation.restaurant = current_restaurant
		respond_to do |format|
   			format.html {render :html => current_restaurant} # show.html.erb
   			format.json  { render :json => current_restaurant }
   			format.xml { render :xml => current_restaurant }
    	end
		
	end



	def new
		@current_restaurant = Restaurant.new
	end

	def create
		@restaurant = current_owner.restaurants.build(params[:restaurant])
		respond_to do |format|
			if @restaurant.save
    			format.html  { redirect_to(restaurants_path,
    							:notice => 'Restaurant was successfully created.') }
    			format.json  { render :json => current_restaurant,
    							:status => :created, :location => current_restaurant }
      		else
        		format.html { render :action => 'new' }
        		format.json { render :json => current_restaurant.errors,
                      			:status => :unprocessable_entity }
    		end
    	end
	end

	def edit
		current_restaurant = Restaurant.find(params[:id])
	end

	def update
		current_restaurant = Restaurant.find(params[:id])
		
		respond_to do |format|
    		if current_restaurant.update_attributes(params[:restaurant])
      			format.html  { redirect_to(current_restaurant,
                    :notice => 'Restaurant was successfully updated.') }
      			format.json  { head :no_content }
    		else
      			format.html  { render :action => "edit" }
      			format.json  { render :json => current_restaurant.errors,
                    :status => :unprocessable_entity }
    		end
    	end
  	end
	
	def destroy
		current_restaurant = Restaurant.find(params[:id])
		current_restaurant.destroy

		respond_to do |format|
			format.html { redirect_to restaurants_url }
			format.json { head :no_content }
		end
	end

	private
	#def require_current_restaurant
	#	render_not_found unless current_restaurant
	#end

	def require_current_restaurant
		unless current_restaurant
			render :text => "404", :status => :render_not_found
		end
	end
	helper_method :current_restaurant
	def current_restaurant
		@current_restaurant ||= Restaurant.find_by_id(params[:id])
	end
end
