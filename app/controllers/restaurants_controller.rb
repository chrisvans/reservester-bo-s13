class RestaurantsController < ApplicationController
  before_filter :authenticate_owner!, :except => [:index, :show]
  before_filter :require_ownership, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new
    @reservation.restaurant = @restaurant
  end

  def new #form to create a new restaurant
    @restaurant = Restaurant.new
  end

  def create #create a new restaurant
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.owner = current_owner
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render "new"
    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant, notice: "Restaurant was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end
end
