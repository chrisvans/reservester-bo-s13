class ApplicationController < ActionController::Base
  protect_from_forgery

  #cancan wants to see a 'current_user' but we have an Owner class instead of a User class
  def current_user
    current_owner
  end
end
