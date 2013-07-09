class ReservationsController < ApplicationController
	def new
		@reservation = Restaurant.find(params[:restaurant_id]).reservations.new
		@reservations = Restaurant.find(params[:restaurant_id]).reservations.where(:is_master => true).where(:taken => false)
		@reservations.sort! { |a,b| if a.r_time == 4 then (a.r_time[0]+'.'+a.r_time[2]).to_f else (a.r_time[0]+a.r_time[1]+'.'+a.r_time[3]).to_f end <=> if b.r_time.length == 4 then (b.r_time[0]+'.'+b.r_time[2]).to_f else (b.r_time[0] + b.r_time[1]+'.'+b.r_time[3]).to_f end}
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
        @reservation = Restaurant.find(params[:restaurant_id]).reservations.new
        @reservation_master = Reservation.where(:r_time => params[:r_time]).where(:is_master => true)[0]
        
        @reservation.r_time = params[:r_time]
        @reservation.anon_name = params[:anon_name]
        @reservation.reserved_on = params[:reserved_on]
        
        @reservation_master.tables_taken += 1
        if @reservation_master.tables_taken == @reservation_master.tables_max
        	@reservation_master.taken = true
        end

        if @reservation.save && @reservation_master.save
          redirect_to root_url, notice: 'Reservation was successfully created.'
        else
          render action: "new", notice: 'There was an error.'
        end

    end
end
