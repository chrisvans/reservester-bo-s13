require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
   test "pretty string" do
     name = "Thai Restaurant"
     address = "555 Main Street, Cambridge, MA"
     restaurant = Restaurant.new(:name => name, :address => address)

     prettyresult = restaurant.pretty_string
     assert_equal "Thai Restaurant - 555 Main Street, Cambridge, MA", prettyresult 
   end


end
