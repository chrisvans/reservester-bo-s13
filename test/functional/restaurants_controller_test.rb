require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

  # def setup
  #   @restaurant = restaurants(:one)
  # end

  # def teardown
  #   @restaurant = nil
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    @owner = create_and_sign_in_owner

    get :new
    assert_response :success
  end

  test "should create restaurant" do
    @owner = create_and_sign_in_owner

    assert_difference('Restaurant.count') do
      post :create, :restaurant => { :name => 'h', :address => 'h', :description => 'h', :phone_number => '1' }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    @owner = create_and_sign_in_owner
    @restaurant = @owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    get :show, :id => @restaurant.id
    assert_response :success
  end

  test "should raise RecordNotFound when not found" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, :id => -1
    end
  end

  test "should get edit" do
    @owner = create_and_sign_in_owner
    @restaurant = @owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    get :edit, :id => @restaurant.id
    assert_response :success
  end

  test "should 401 for edit when restaurant owner do not match" do
    @current_owner = create_and_sign_in_owner
    actual_owner = Owner.create :name => 'blah', :email => 'blah@gmail.com', :password => 'blahblah', :password_confirmation => 'blahblah'
    @restaurant = actual_owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    get :edit, id: @restaurant
    assert_response :unauthorized

  end

  test "should update restaurant" do
    @owner = create_and_sign_in_owner
    @restaurant = @owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    put :update, :id => @restaurant.id, :restaurant => { }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should 401 for update when restaurant owner do not match" do
    @current_owner = create_and_sign_in_owner
    actual_owner = Owner.create :name => 'blah', :email => 'blah@gmail.com', :password => 'blahblah', :password_confirmation => 'blahblah'
    @restaurant = actual_owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    put :update, :id => @restaurant.id, :restaurant => { }
    assert_response :unauthorized
  end

  test "should destroy restaurant" do
    @owner = create_and_sign_in_owner
    @restaurant = @owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    assert_difference('Restaurant.count', -1) do
      delete :destroy, :id => @restaurant.id
    end
    assert_redirected_to restaurants_path
  end

  test "should 401 for destroy when restaurant owner do not match" do
    @current_owner = create_and_sign_in_owner
    actual_owner = Owner.create :name => 'blah', :email => 'blah@gmail.com', :password => 'blahblah', :password_confirmation => 'blahblah'
    @restaurant = actual_owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
    assert_no_difference('Restaurant.count') do
      delete :destroy, :id => @restaurant.id
    end
    assert_response :unauthorized
  end


  private

  def create_and_sign_in_owner
    owner = Owner.create :name => 'John', :email => 'john@gmail.com', :password => 'foobar123', :password_confirmation => 'foobar123'

    sign_in owner

    owner
  end

end
