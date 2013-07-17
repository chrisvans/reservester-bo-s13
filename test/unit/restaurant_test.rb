require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test "should not save a restaurant without a name" do 
  	restaurant = Restaurant.new
  	assert !restaurant.save
  end

  test "example test" do 
  	assert true
  end
  
end
