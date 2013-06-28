require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

  def setup
    @restaurant = restaurants(:one)
  end

  def teardown
    @restaurant = nil
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, :restaurant => { :name => 'h', :address => 'h', :description => 'h', :phone_number => '1' }
    end
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, :id => @restaurant.id
    end
    assert_redirected_to restaurants_path
  end

  test "should get edit" do
    get :edit, :id => @restaurant.id
    assert_response :success
  end

  test "should update restaurant" do
    put :update, :id => @restaurant.id, :restaurant => { }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, :id => @restaurant.id
    assert_response :success
  end

  test "should raise RecordNotFound when not found" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, :id => -1
    end
  end

end
