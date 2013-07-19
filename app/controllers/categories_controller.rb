class CategoriesController < ApplicationController
	def index
		@categories = Category.order(:name)
		respond_to do |format|
			format.html
			format.json { render json: @categories.where("name like ?", "%#{params[:q]}%") }
			end		
end
