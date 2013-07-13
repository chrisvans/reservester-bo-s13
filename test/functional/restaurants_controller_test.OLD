require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should show restaurant" do
    @owner = create_owner
    @restaurant = @owner.restaurants.create :name => 'My Show Restaurant', :address => '4321 Main Ave. Boston MA'
    get :show, id: @restaurant
    assert_response :success
  end

  test "should show error with invalid id" do
    assert_raise(ActiveRecord::RecordNotFound) {
      get :show, id: '-2'
    }
  end  

  test "should get new" do
    @owner = create_owner
    get :new, :owner_id => @owner.id
    assert_response :success
  end

  test "should create restaurant" do
    @owner = create_owner

    assert_difference('Restaurant.count') do
      post :create, :owner_id => @owner.id, restaurant: {
        name: 'myrestaurant1',
        description: 'Best cuisine in town..',
        address: '123 mystreet',
        phone: '890-789-9823'
      }
    end
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should get edit" do
    @owner = create_owner
    @restaurant = @owner.restaurants.create :name => 'My Restaurant'
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    @owner = create_owner
    @restaurant = @owner.restaurants.create(:one)

    put :update, id: @restaurant, restaurant: {  }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    @owner = create_owner
    @restaurant = @owner.restaurants.create(:one)

    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end
    assert_redirected_to restaurants_path
  end

  private

  def create_owner
    owner = Owner.create :name => 'User1', :email => 'user1@example.com', :password => 'foobar', :password_confirmation => 'foobar'
    sign_in owner
    owner
  end

end
