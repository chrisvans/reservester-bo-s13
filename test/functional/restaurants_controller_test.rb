require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    owner = create_and_sign_in_owner
  	get :new
  	assert_response :success #test fails, currently being redirect (probably to owner login)
  end

  test "should show restaurant" do
  	get :show, id: @restaurant
  	assert_response :success
  end

  test "should create restaurant" do
    owner = create_and_sign_in_owner

  	assert_difference('Restaurant.count', 1) do
  		post :create, restaurant: {
        :name => 'Scotts Burrito Shack'
      }
  	end
  	assert_redirected_to restaurant_path(assigns(:restaurant))
  end


end
