class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, :except => [:index, :show]
  before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
    if @restaurant.nil?
      render :text => 'Not Found', :status => :not_found
    end
    @reservation = Reservation.new
    @reservation.restaurant = @restaurant
  end

  def new
    @owner = Owner.find(params[:owner_id])
    @restaurant = Restaurant.new
  end

  def create
    # render text: params[:restaurant].inspect
    @owner = Owner.find(params[:owner_id])
    @restaurant = @owner.restaurants.build(params[:restaurant])

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: "new"
    end
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    params[:restaurant][:category_ids] ||= []

    @restaurant = Restaurant.find(params[:id])
    #@categories = Category.find(:all, :order => 'name')

    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant
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
