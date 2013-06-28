class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
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

    respond_to do |format|
      format.html #show.html.erb
      format.json { render :json => @restaurant }
    end
  end

  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @restaurants }
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to(@restaurant,
                      :notice => 'Post was successfully update.') }
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

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
  
end