require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
   test "pretty string" do
		name = "Mi Pueblito"
		address = "123 Elm st. Somerville, MA"
		restaurant = Restaurant.new(:name => name, :address => address)

		# method pretty_string located in models/restaurnant.rb
		prettyresult = restaurant.pretty_string
		assert_equal = "Mi Pueblito - 123 Elm st. Somerville, MA", prettyresult
   end
end
