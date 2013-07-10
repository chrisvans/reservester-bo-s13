class RestaurantsController < ApplicationController

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
		@restaurant = Restaurant.find(params[:id])
		respond_to do |format|
    		format.html  # show.html.erb
    		format.json  { render :json => @restaurant }
    		format.xml { render :xml => @restaurant }
    	end
		
	end



	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_owner.restaurants.build(params[:restaurant])
		respond_to do |format|
			if @restaurant.save
    			format.html  { redirect_to(restaurants_path,
    							:notice => 'Restaurant was successfully created.') }
    			format.json  { render :json => @restaurant,
    							:status => :created, :location => @restaurant }
      		else
        		format.html { render :action => 'new' }
        		format.json { render :json => @restaurant.errors,
                      			:status => :unprocessable_entity }
    		end
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

	private

	def require_restaurant_owner_match!
    @restaurant = Restaurant.find(params[:id])

    unless @restaurant.owner == current_owner
      	render "unauthorized", :status => :unauthorized
    end
	end

end
