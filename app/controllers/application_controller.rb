class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_restaurant_owner_match!
    @restaurant = Restaurant.find(params[:id])

    unless @restaurant.owner == current_owner
      render "unauthorized", :status => :unauthorized
    end
  end  
end
