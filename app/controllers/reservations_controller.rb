class ReservationsController < ApplicationController
  before_filter :require_current_reservation, :only => :destroy
  before_filter :require_current_restaurant, :only => :create
  before_filter :require_restaurent_owner_match!, :except => :create

  def create
    @reservation = current_restaurant.reservations.build(params[:reservation])

    if @reservation.save
      ReservationMailer.reservation_notification(@reservation).deliver
      redirect_to current_restaurant, :notice => 'Your reservation has been created'
    else
      render 'restaurants/show', :status => :unprocessable_entity
    end
  end

  def destroy
    current_reservation.destroy
    redirect_to current_reservation.restaurant
  end

  private

  def require_current_reservation
    render_not_found unless current_reservation
  end

  def current_reservation
    @current_reservation ||= Reservation.find_by_id(params[:id])
  end

  def require_current_restaurant
    render_not_found unless current_restaurant
  end
  
  helper_method :current_restaurant
  def current_restaurant
    @current_restaurant ||= Restaurant.find_by_id(params[:restaurant_id]) || current_reservation.try(:restaurant)
  end
end
