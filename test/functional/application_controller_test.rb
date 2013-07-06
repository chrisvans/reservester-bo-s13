require 'test_helper'

class TestController < ApplicationController
  before_filter :require_restaurant_owner_match!, :only => :restaurant_info
  before_filter :authenticate_owner!, :only => :restaurant_info

  def bad_request
    render_not_found :bad_request
  end


  def restaurant_info
    render :json => current_restaurant.as_json
  end


  private

  def current_restaurant
    @current_restaurant ||= Restaurant.find_by_id(params[:restaurant_id])
  end
end

class ApplicationControllerTest < ActionController::TestCase
  setup :setup_bogus_controller_routes!
  teardown  :teardown_bogus_controller_routes!
  self.controller_class = TestController

  test "render_not_found :bad_request" do
    get :bad_request
    assert_response :bad_request
  end

  test "require_restaurant_owner_match! prevents non owner fromseeing it" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant)

    get :restaurant_info, :restaurant_id => restaurant.id
    assert_response :unauthorized
  end

  test "require_restaurant_owner_match! allows owner to see it" do
    owner = create_and_sign_in_owner

    restaurant = FactoryGirl.create(:restaurant, :owner => owner)

    get :restaurant_info, :restaurant_id => restaurant.id
    assert_response :success
    assert_equal restaurant.name, ActiveSupport::JSON.decode(@response.body)['name']
  end

end
