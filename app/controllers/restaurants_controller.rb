class RestaurantsController < ApplicationController


before_filter :authenticate_owner!, except: [:index, :show]
#before_filter :require_current_restaurant!, :only => [:show, :edit, :update, :destroy]
#add this so a non-owner can't go through the inspector and edit, update or destroy a copy
#before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]


	def index
		@restaurant = Restaurant.order("created_at DESC")
	end


	def new
		@restaurant = Restaurant.new(params[:restaurant])		
	end

	def show
		current_restaurant

		@reservation = Reservation.new
    	@reservation.restaurant = current_restaurant
    	#this will output json and can be used straight for IOS development
    	#respond_to do |format|
    	#	format.json { render :json => @restaurant}
    	#end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end


	def create
		@restaurant = current_owner.restaurants.create(params[:restaurant])
			if @restaurant.save
				flash[:notice] = "We saved your restaurant entry"
				redirect_to @restaurant
			else
				render ('new')
			end
	end

	def update
		@restaurant = current_owner.restaurants.find(params[:id])
		if @restaurant.update_attributes(params[:restaurant])
			flash[:notice] = "We updated your entry"
			redirect_to @restaurant
		else
			flash[:notice] = "Something went terribly wrong and we couldn't update your entry"
			render ('edit')
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id]).destroy
		flash[:notice] = "You entry has been deleted"
		redirect_to root_path
	end

	private

	def require_current_restaurant
		render_not_found unless current_restaurant
	end


	helper_method :current_restaurant
		def current_restaurant
			@current_restaurant ||= Restaurant.find_by_id(params[:id]) #find_by_id only looks for id and returns nil if not found, rather than exception
		end


end
