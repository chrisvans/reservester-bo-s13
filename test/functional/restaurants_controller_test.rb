require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "controller request fails" do
    get :show, :id => 'bagel'
    assert_response :not_found
  end

  test "controller request passes" do
    cheesecake = FactoryGirl.create(:restaurant)
    get :show, :id => cheesecake.id
    assert_response :success
  end

end
