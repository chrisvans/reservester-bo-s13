require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
	test "should send reservation notification" do
		date = 2.days.since
		owner = Owner.create :name => 'James Reading', :email => 'test@gmail.com', :password => 'password', :password_confirmation => 'password'
		restaurant = owner.restaurants.create :name => 'Curry Dosa', :address => '123 Test Street', :description => 'Serves Curry Yeah!', :phone_number => '123'
		reservation = restaurant.reservations.create :email => 'customer@gmail.com', :message => 'Test Message', :reserve_on => date

		email = ReservationMailer.reservation_notification(owner,reservation).deliver

		assert !ActionMailer::Base.deliveries.empty?

		assert_equal ['reservester@reservester.com'], email.from
		assert_equal [owner.email], email.to
		assert_equal "New Reservation at #{restaurant.name}", email.subject
	end

end