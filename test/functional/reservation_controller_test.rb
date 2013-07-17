require 'test_helper'

class ReservationControllerTest < ActionController::TestCase

	test "create restaurant not found" do 
		post :create, :restaurant_id => 'yolo'
		assert_response :not_found #http response code
	end

	test "create validation error" do 
		restaurant = FactoryGirl.create(:restaurant)

		#fill in 

	end

	test "create success" do 
		assert_difference 'Reservation.count' 
	end 
	
end
