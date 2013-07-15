class OwnersController < ApplicationController
  def dashboard
  	@owner = current_owner
  	@restaurants = current_owner.restaurants
  end
end
