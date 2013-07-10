class ApplicationController < ActionController::Base
  protect_from_forgery


  private
  def require_ownership
  	if !params[:restaurant_id].blank?
  		@restaurant = Restaurant.find(params[:restaurant_id])
  	else
		@restaurant = Restaurant.find(params[:id])
	end
	
    unless @restaurant.owner == current_owner
      render "unauthorized", :status => :unauthorized #sets HTTP status code
    end
  end
end
