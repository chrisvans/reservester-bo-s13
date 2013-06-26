class RestaurantsController < ApplicationController
  def new

  end

  def create
    render text: params[:restaurant].inspect
  end
end
