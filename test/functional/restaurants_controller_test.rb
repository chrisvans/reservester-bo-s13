require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should show restaurant" do
  	get :show, id: @restaurant
  	assert_response :success
  end

  test "should create restaurant" do
  	assert_difference('Restaurant.count') do
  		post :create, restaurant: {}
  	end
  	assert_redirected_to restaurant_path(assigns(:restaurant))
  end


end
