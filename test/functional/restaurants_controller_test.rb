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

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should show error with invalid id" do
    assert_raise(ActiveRecord::RecordNotFound) {
      get :show, id: '-2'
    }
  end  

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: {
        name: 'myrestaurant1',
        description: 'Best cuisine in town..',
        address: '123 mystreet',
        phone: '890-789-9823'
      }
    end
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    get :update, id: @restaurant, restaurant: {  }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end
    assert_redirected_to restaurants_path
  end

end
