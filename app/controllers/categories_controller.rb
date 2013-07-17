class CategoriesController < ApplicationController
  
  def index
  	@restaurant = Restaurant.new
  	@categories = Category.where("name ilike ?", "%#{params[:q]}%")

  	respond_to do |format|
  		format.html
  		format.json { render :json => @categories.map(&:attributes) }
  	end
  end

  def show
  	@category = Category.find_by_id(params[:id])
  	@restaurants = @category.restaurants
  end
end