require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
	test "testing if controller request fails" do 
		get :show, :id => 1
		#makeing an assertion of what should happen
		assert_response :not_found
	end

	test "testing if controller request passes" do
		restaurant = FactoryGirl.create(:restaurant)
		get :show, :id => restaurant.id
		assert_response :success
	end

	test "create restaurant" do
		owner = create_and_sign_in_owner
		# Creating a restaurant and pass the owner ID
		assert_difference('Restaurant.count', 1) do
			post :create, :owner_id => owner.id, :restaurant => {
				:name => 'Chipottle',
				:address => 'Kendal sq',
				:phone => '555-666-7777',
				:description => 'Best Burritos'
			}
		end
		assert_redirected_to restaurant_path(assigns(:restaurant))
	end

	test "create and destroy a restaurant" do
		owner = create_and_sign_in_owner

		restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    	assert_difference('Restaurant.count', -1) do
      		delete :destroy, id: restaurant
    	end
    	assert_redirected_to restaurants_path
	end
end