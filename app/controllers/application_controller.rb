class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_restaurant_owner_match!
  	@restaurant = Restaurant.find(params[:id])

  	unless @restaurant.owner == current_owner
  	  #render "unauthorized", :status => unauthorized
  	  flash[:error] = "Sorry, you don't have permission."
      redirect_to :back
  	end
  end
end



#private

#  def require_restaurant_owner_match!
#    @restaurant = Restaurant.find(params[:id])

#    if @restaurant.owner == current_owner
#      return
#    else
#      flash[:error] = "Sorry, you don't have permission."
#      redirect_to :back
#    end
#  end