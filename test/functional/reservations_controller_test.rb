require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
	
	test "should create reservation for restaurant" do
		@owner = create_and_sign_in_owner
		@restaurant = @owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
		date = 1.day.since
		assert_difference('Reservation.count', 1) do
			post :create, :restaurant_id => @restaurant.id, :reservation => { :email => 'h@gmail.com', :reserve_on => date, :message => 'h' }
		end
	assert_redirected_to restaurant_path(@restaurant)
	end

	test "should destroy reservation for restaurant" do
		@owner = create_and_sign_in_owner
		@restaurant = @owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
		date = 1.day.since
		@reservation = @restaurant.reservations.create :email => 'h@gmail.com', :reserve_on => date, :message => 'h'
		assert_difference('Reservation.count', -1) do
			delete :destroy, :restaurant_id => @restaurant.id, :id => @reservation.id
		end
		assert_redirected_to restaurant_path(@restaurant)
	end

	test "should not destroy reservation for wrong owner" do
		@owner = create_and_sign_in_owner
		actual_owner = Owner.create :name => 'blah', :email => 'blah@gmail.com', :password => 'blahblah', :password_confirmation => 'blahblah'
		@restaurant = actual_owner.restaurants.create :name => 'h', :address => 'h', :description => 'h', :phone_number => '1'
		date = 1.day.since
		@reservation = @restaurant.reservations.create :email => 'h@gmail.com', :reserve_on => date, :message => 'h'
		assert_no_difference('Reservation.count') do
			delete :destroy, :restaurant_id => @restaurant.id, :id => @reservation.id
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