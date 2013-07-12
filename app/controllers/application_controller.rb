class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_not_found(status=:not_found)
  	render :json => {
  		:error => "Sorry bro. That's not allowed",
  		:status => status.to_s 
  	},
  		:status => status
  end

end
