class ReservationsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end
end
