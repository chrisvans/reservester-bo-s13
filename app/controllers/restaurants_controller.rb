class RestaurantsController < ApplicationController
 def index 
  @restaurants = Restaurant.all
 end

 def show
  @restaurant = Restaurant.find(params[:id])
 end

 def new
  @restaurant = Restaurant.new 
 end

 def edit
  @restaurant = current_owner.restaurants.find(params[:id])  
 end

 def create
  @restaurant = current_owner.restaurants.new(params[:restaurant])

  if @restaurant.save
    redirect_to @restaurant, notice: 'Restaurant was successfully created.'
  else
     render action: "new" 
  end
 end
  
 def update
    @restaurant = current_owner.restaurants.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit"
    end
  end

 def destroy
  @restaurant = current_owner.restaurants.find(params[:id])
  @restaurant.destroy

  redirect_to restaurants_url
 end

end