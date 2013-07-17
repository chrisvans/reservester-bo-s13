# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  address     :text
#  phone       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  menu        :string(255)
#  owner_id    :integer
#

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
