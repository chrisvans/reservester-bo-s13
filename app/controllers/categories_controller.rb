class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def search
		# @restaurants = Restaurant.joins(:categories).where('categories.id' => params[:category_ids])
		@restaurants = Restaurant.joins(:categories)
		params[:category_ids].each do |cat_id|
			@restaurants = @restaurants.where('categories.id' => cat_id)
		end
		render :text => "#{@restaurants.map { |r| r.name }}"
	end
end
