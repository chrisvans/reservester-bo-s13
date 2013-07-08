class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def create

		@reservation = Reservation.new(params[:id])


		if @reservation.save
			redirect_to restaurants_path
		else
			render 'new'
		end
	end


end
