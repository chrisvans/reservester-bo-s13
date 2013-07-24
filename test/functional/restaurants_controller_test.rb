require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get index (json)" do
    restaurant = FactoryGirl.create :restaurant
    get :index, :format => :json
    assert_response :success
    response = ActiveSupport::JSON.decode @response.body
    assert_equal 1, response.count
    assert_equal restaurant.name, response.first["name"]
  end

  test "should get new" do
    owner = create_and_sign_in_owner

    get :new, :owner_id => owner.id
    assert_response :success
  end

  test "should create restaurant" do
    owner = create_and_sign_in_owner

    assert_difference('Restaurant.count') do
      post :create, :restaurant => { :name => 'A Restaurant' }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
    assert_equal owner, assigns[:restaurant].owner
  end

  test "create validation error" do
    owner = create_and_sign_in_owner

    assert_no_difference('Restaurant.count') do
      post :create
    end

    assert_response :unprocessable_entity
  end

  test "should show restaurant" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    get :show, id: restaurant
    assert_response :success
  end

  test "should raise 404 with an invalid restaurant" do
    assert_raise ActiveRecord::RecordNotFound do
      get :show, id: 'abcd'
    end
  end

  test "should get edit" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    get :edit, id: restaurant.id
    assert_response :success
  end

  test "should 401 for edit when restaurant owner do not match" do
    current_owner = create_and_sign_in_owner
    actual_owner = FactoryGirl.create(:owner)

    restaurant = FactoryGirl.create(:restaurant, :owner => actual_owner)

    get :edit, id: restaurant.id
    assert_response :unauthorized
  end

  test "should update restaurant" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    put :update, id: restaurant.id, restaurant: {  }
    assert_redirected_to restaurant_path(restaurant)
  end

  test "update restaurant validation error" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    put :update, id: restaurant.id, restaurant: { name: ''  }

    assert restaurant.reload.name.present?
    assert_response :unprocessable_entity
  end

  test "should 401 for update when restaurant owner do not match" do
    current_owner = create_and_sign_in_owner
    actual_owner = FactoryGirl.create(:owner)

    restaurant = FactoryGirl.create(:restaurant, :owner => actual_owner)

    put :update, id: restaurant.id, restaurant: {  }

    assert_response :unauthorized
  end

  test "should destroy restaurant" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: restaurant.id
    end

    assert_redirected_to restaurants_path
  end

  test "should 401 for destroy when restaurant owner do not match" do
    current_owner = create_and_sign_in_owner
    actual_owner = FactoryGirl.create(:owner)

    restaurant = FactoryGirl.create(:restaurant, :owner => actual_owner)

    assert_no_difference('Restaurant.count') do
      delete :destroy, id: restaurant.id
    end

    assert_response :unauthorized
  end
end