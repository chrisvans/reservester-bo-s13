class RestaurantsController < ApplicationController
  def new
  end

  def create
  	@restaurant = Restaurant.new(params[:restaurant])

  	@restaurant.save
  	redirect_to @restaurant
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