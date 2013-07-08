class RestaurantsController < ApplicationController
  
  before_filter :authenticate_owner!, except: [:index]
  def index
    @restaurants = Restaurant.all
    # @restaurants = Restaurant.all
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
    hour = '5'
    minute = '00'
    endhour = '12'
    for element in (1..(endhour.to_i - hour.to_i)*2+1)
        reservation_setup = @restaurant.reservations.new
        reservation_setup.r_time = hour + ':' + minute
        reservation_setup.taken = false
        reservation_setup.save
        if element % 2 == 0
          hour = (hour.to_i + 1).to_s
          minute = '00'
        else
          minute = '30'
        end
    end


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