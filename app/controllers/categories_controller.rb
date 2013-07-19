class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		respond_to do |format|
			format.html
			format.json { render json: Category.where("name like ?", "%#{params[:q]}%") }
		end
	end
end


