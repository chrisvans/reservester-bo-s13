require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

	def setup
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
		assert_difference('Restaurant.count') do
			post :create, :restaurant => { :restaurant => 'Some restaurant'}
		end

		assert_redirected_to restaurant_path(assigns(:restaurant))
		assert_equal 'Restaurant was successfully created.', flash[:notice]
	end

	test "should show restaurant" do
		get :show, id: @restaurant.id
		assert_response :success
	end

	test "should raise 404 with an invalid restaurant" do
		assert_raise(ActiveRecord::RecordNotFound) {
			get :show, id: 'abcd'
		}
	end

	test "should get edit" do
		get :edit, id: @restaurant.id
		assert_response :success
	end

	test "should update restaurant" do
		put :update, id: @restaurant.id, restaurant: {  }
		assert_redirected_to restaurant_path(assigns(:restaurant))
	end

	test "should destroy restaurant" do
		assert_difference('Restaurant.count', -1) do
			delete :destroy, id: @restaurant.id
		end

		assert_redirected_to restaurants_path
	end
end
