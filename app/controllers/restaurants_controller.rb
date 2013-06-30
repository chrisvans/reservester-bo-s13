class RestaurantsController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :new, :create]

	def new
		@restaurant = Restaurant.new
	end

	def destroy
		@rest = Restaurant.find(params[:id])
		@rest.destroy

		redirect_to restaurants_path
	end

	def edit
		@rest = Restaurant.find(params[:id])
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@image = ImageUploader.new
	end


	def create
		@rest = Restaurant.new(params[:restaurant])

		if @rest.save
			redirect_to @rest
		else
			render 'new'
		end
	end

	def index
		@rest = Restaurant.all
	end 

	def update
		@rest = Restaurant.find(params[:id])
		if @rest.update_attributes(params[:restaurant])
			redirect_to @rest
		else
			render 'edit'
		end
	end

	# private
	# 	def post_params
	# 		params.require(:post).permit(:name, :description, :address, :phone_number)
	# 	end


end
