class RestaurantsController < ApplicationController
  before_filter :require_current_restaurant, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_owner!, :except => [:index, :show]
  before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html
      format.json { render :json => @restaurants }
    end
  end

  def show
    @reservation = Reservation.new(:restaurant => current_restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = current_owner.restaurants.build(params[:restaurant])

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render 'new', :status => :unprocessable_entity
    end
  end

  def update
    if current_restaurant.update_attributes(params[:restaurant])
      redirect_to current_restaurant, notice: 'Restaurant was successfully updated.'
    else
      render 'edit', :status => :unprocessable_entity
    end
  end

  def destroy
    current_restaurant.destroy
    redirect_to restaurants_url
  end

  private
  def require_current_restaurant
    render_not_found unless current_restaurant
  end

  helper_method :current_restaurant
  def current_restaurant
    @current_restaurant ||= Restaurant.find(params[:id])
  end
end
