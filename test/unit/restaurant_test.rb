require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
	test "pretty string for restaurant address" do
		name = "Pizza Hut"
		street = "123 Fast Street"
		restaurant = Restaurant.create(:name => name, :street => street)

		pretty_string_result = restaurant.pretty_string

		assert_equal "Pizza Hut - 123 Fast Street", pretty_string_result

	end

end
