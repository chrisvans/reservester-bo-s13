require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  test "create restaurant not found" do
    post :create, :restauraunt_id => 'yolo'
    assert_response :not_found
  end

  test "create validation error" do
    restaurant = FactoryGirl.create(:restaurant)
    assert_no_difference 'Reservation.count' do
      post :create, :restaurant_id => restaurant.id
    end

    assert_response :unprocessable_entity
  end

  test "create success" do
    restaurant = FactoryGirl.create(:restaurant)
    assert_difference 'Reservation.count' do
      post :create, :restaurant_id => restaurant.id, :reservation => {
        :reserve_on => Time.now + 10.days,
        :email      => 'rainbro@swagmail.com'
      }
    end

    assert_redirected_to restaurant_path(restaurant)
  end


  test "destroy not found" do
    assert_no_difference 'Reservation.count' do
      delete :destroy, :id => 'omg'
    end
    assert_response :not_found
  end

  test "destroy success" do
    reservation = FactoryGirl.create(:reservation)
    sign_in reservation.restaurant.owner

    assert_difference 'Reservation.count', -1 do
      delete :destroy, :id => reservation
    end

    assert_redirected_to restaurant_path(reservation.restaurant)
  end
end
