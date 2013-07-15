class ReservationsController < ApplicationController

  before_filter :authenticate_owner!, :only => [ :edit, :destroy ]

	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
 	    @restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
        @restaurant = Restaurant.find params[:restaurant_id]

        @reservation = @restaurant.reservations.build params[:reservation]
        
        @information = [@restaurant.owner, @reservation, @restaurant]

        if @reservation.save
          @worker_information = @reservation.id
          Resque.enqueue(MailWorker, @worker_information)
          # ReservationMailer.reservation_notice(@information).deliver
          redirect_to @restaurant, notice: 'Reservation was successfully created.'
        else
          render 'restaurants/show'
        end
    end

    def destroy
	    @reservation = Reservation.find params[:id]
	    @restaurant = @reservation.restaurant

      @information = [@reservation.restaurant.owner, @reservation, @reservation.restaurant]

      puts '---------------------------------'
      puts @information
      puts '---------------------------------'

      ReservationMailer.reservation_accepted(@information).deliver
      #@worker_information = @reservation.id
      #Resque.enqueue(MailWorker, @worker_information)
      @reservation.destroy
      redirect_to @restaurant, notice: 'Reservation confirmation sent.'

     end

  def edit
    @reservation = Reservation.find params[:id]
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def update
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @reservation.update_attributes(params[:reservation])
      redirect_to @restaurant, notice: 'Reservation was successfully updated.'
    else
      render action: "edit"
    end
  end

end
