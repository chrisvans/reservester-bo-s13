class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def edit

  end

  def create
  	@restaurant = Restaurant.new(params[:restaurant])

  	respond_to do |format|
      if @restaurant.save
        format.html { redirect_to(@restaurant, 
                      :notice => 'Post was successfully created.')}
        format.json { render :json => @restaurant,
                      :status => :created, :location => @restaurant }
      else
        format.html { render :action => 'new' }
        format.json { render :json => @restaurant.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @restaurants }
    end
  end
  
end