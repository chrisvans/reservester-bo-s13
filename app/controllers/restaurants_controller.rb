class RestaurantsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
#  before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

  def index
    if current_user.try(:is_owner?)
      redirect_to '/dashboard'
    else
      @categories = Category.all
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    @reservation = Reservation.new
    @reservation.restaurant = @restaurant
  end

  def new
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @restaurant = @user.restaurants.build(params[:restaurant])

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    params[:restaurant][:category_ids] ||= []
    @restaurant = Restaurant.find(params[:id])

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