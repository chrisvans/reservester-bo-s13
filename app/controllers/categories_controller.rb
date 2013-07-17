class CategoriesController < ApplicationController
  
  def index
  	@restaurant = Restaurant.new
  	@categories = Category.all

    # Turns out I didn't need this.
  	# @categories = Category.where("name ilike ?", "%#{params[:q]}%")

  	respond_to do |format|
  		format.html
  		format.json { render :json => @categories.map(&:attributes) }
  	end
  end

  # def show
  # 	@categories = Category.where(:id => params[:id])
  # 	@restaurants = @categories.map(&:restaurants).flatten.uniq
  # end

end