class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  	def require_restaurant_owner_match!
    	current_restaurant = Restaurant.find(params[:id])

    	unless current_restaurant.owner == current_owner
      		render "unauthorized", :status => :unauthorized
    	end
	end

	def render_not_found(status=:not_found)
		render :json => {
			:error => "Get outta here.",
			:status => status.to_s,
			:params => params
			}, :status => status
	end

end
