class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_restaurant_owner_match!
    unless current_restaurant.owner == current_owner
      render "shared/unauthorized", :status => :unauthorized
    end
  end

  def render_not_found(status=:not_found)
    render :json => {
      :error  => "Sorry, bro.  That's not allowed",
      :status => status.to_s # for easy debugging
    }, :status => status
  end

end
