require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@restaurant = restaurants(:one)
  end

  test "should get index" do
  	get :index
  	assert_response :success
  	assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should create restaurant" do
  	assert_difference('Restaurant.count', 1) do
  		post :create, restaurant: { name: 'Blah', description: 'Blah', 
        address: 'Blah', phone: '123456789'}
  	end
  	assert_redirected_to restaurant_path(assigns :restaurant)
  end

  test "should show restaurant" do
  	get :show, id: @restaurant
  	assert_response :success
  end

  test "should fail to show invalid rest id" do
  	assert_raise(ActiveRecord::RecordNotFound) {
  		get :show, id: 'asdf'
  	}
  end

  test "should get edit" do
  	get :edit, id: @restaurant
  	assert_response :success
  end

  test "should update restaurant" do
  	put :update, id: @restaurant, restaurant: {  	}
  	assert_redirected_to restaurant_path(assigns :restaurant)
  end

  test "should destroy restaurant" do
  	assert_difference('Restaurant.count', -1) do
  		delete :destroy, id: @restaurant
  	end
  	assert_redirected_to restaurants_path
  end
  
end
