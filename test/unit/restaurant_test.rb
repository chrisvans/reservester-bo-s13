require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "new restaurants have name" do
    restaurant = Restaurant.new
    assert !restaurant.save
    assert !restaurant.errors[:name].empty?
  end
end
