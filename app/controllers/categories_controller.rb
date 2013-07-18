class CategoriesController < ApplicationController
  
  def index
    @restaurant = Restaurant.new 
    @categories = Category.all
    # @categories_chosen = Category.where("name ilike ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @categories.map(&:attributes) }
    end
  end

  def get_restaurants_by_cat
    cat_ids = []
    params[:cats].split(",").each do |id|
      cat_ids.append(id.to_i)
    end
    params[:cats] = cat_ids
    @categories_chosen = Category.find(params[:cats])
    puts params[:cats] 

    respond_to do |format|
      format.json { render :json => @categories_chosen.to_json(:include => :restaurants) }
    end
  end

  def show
    @categories = Category.where(:id => params[:id])
    @category = Category.find_by_id(params[:id])
    @restaurants = @categories.map(&:restaurants).flatten.uniq
  end

end