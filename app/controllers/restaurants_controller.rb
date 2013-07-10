class RestaurantsController < ApplicationController
  
  before_filter :authenticate_owner!, except: [:index]
  def index
    if owner_signed_in?
      @restaurants = Restaurant.where(:owner_id => current_owner.id)
      puts '---------------------------------------'
      puts @restaurants
      puts current_owner.id
      puts current_owner
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = current_owner.restaurants.find(params[:id])

    
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new

    # @restaurant = Restaurant.new
  end

  def edit
    @restaurant = current_owner.restaurants.find(params[:id])

    # @restaurant = Restaurant.find(params[:id])
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
    @restaurant = Restaurant.find(params[:id])

    # @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_url
  end
end

# Billy bob