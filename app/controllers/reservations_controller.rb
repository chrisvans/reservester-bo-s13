class ReservationsController < ApplicationController

	def index
		@reservation = Reservation.order("created_at DESC")
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new(params[:reservation])	
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = Reservation.create(params[:reservation])	
			if @reservation.save
				flash[:notice] = "We sent your reservation request!"
				redirect_to(:action => 'restaurants/show')
			else
				render ('restaurants/show')
			end
	end

	def update

	end

	def delete

	end




end
