require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get name" do
    get :name
    assert_response :success
  end

  test "should get description" do
    get :description
    assert_response :success
  end

  test "should get address" do
    get :address
    assert_response :success
  end

  test "should get phone:integer" do
    get :phone:integer
    assert_response :success
  end

end
