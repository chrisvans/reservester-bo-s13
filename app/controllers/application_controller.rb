class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_owner
  	current_user.owner? && authenticate_user!
  end

end
