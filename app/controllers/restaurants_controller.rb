class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, :except => [:index, :show]
  before_filter :require_restaurant_owner_match!, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @owner = Owner.find(params[:owner_id])
    @restaurant = Restaurant.new
  end

  def create
    # render text: params[:restaurant].inspect
    @owner = Owner.find(params[:owner_id])
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

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

  private

  def require_restaurant_owner_match!
    @restaurant = Restaurant.find([:id])

    unless @restaurant.owner == current_owner
      render "unauthorized", :status => :unauthorized
    end
  end  
end
