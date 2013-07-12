class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, except: [:index, :show]
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

    @reservation = Reservation.new #create new reserv
    @reservation.restaurant = @restaurant

    respond_to do |format|
      format.html #show.html.erb
      format.json { render :json => @restaurant }
    end
  end

  def new
    @owner = Owner.find(params[:owner_id])
    @restaurant = Restaurant.new

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
  	@owner = Owner.find(params[:owner_id])
    @restaurant = @owner.restaurants.build(params[:restaurant])
    
    if @restaurant.save
      redirect_to @restaurant, :notice => 'Restaurant was successfully created.'
    else
      render :action => 'new' 
    end
    
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to(@restaurant,
                      :notice => 'Post was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @restaurant.errors,
                      :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

     redirect_to restaurants_url 
  end
end