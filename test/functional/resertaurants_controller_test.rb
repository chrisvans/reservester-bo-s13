require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
	test "testing if controller request fails" do
		get :show, {:id => 'boogers'}
		assert_response :not_found
	end
	test "testing if controller request passes" do
		restaurant = FactoryGirl.create(:restaurant)
		get :show, {:id => restaurant.id}
		assert_response :success
	end

end
