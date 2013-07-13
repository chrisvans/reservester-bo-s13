require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "testing if controller request fails" do
    get :show, :id=> 1
    #making assertion about what should happen 
    assert_response :not_found
  end

  test "testing if controller request passes" do
    restaurant = FactoryGirl.create(:restaurant)
    get :show, :id => restaurant.id
    assert_response :success
  end

  test "create restaurant" do

    owner = create_and_sign_in_owner
    # creating a restaurant 
    assert_difference('Restaurant.count',1) do
      #post to create action with restaurant params
      post :create, :restaurant => {
        :name => 'Chipotle',
        :address => 'Kendall',
        :phone => '123456778',
        :description => 'Burritos!!!!!'
      }
    end
    #redirect to newly created restaurant show
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "create and destroy restaurant" do
    #signing in to destroy a restaurant
    owner = create_and_sign_in_owner
    #creating a new restaurant under owner
    restaurant = FactoryGirl.create(:restaurant, :owner => owner)
    # owner.restaurants.create(:name => 'Chipotle', :address => 'Kendall', :phone => '123456778', :description => 'Burritos!!!!!') # deleting a restaurant and checking
    # if difference in restaurant table is -1
    assert_difference('Restaurant.count', -1) do
      delete :destroy, :id => restaurant.id
    end

    #making sure redirects to restaurants index
    assert_redirected_to restaurants_path

  end

end
