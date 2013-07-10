require 'test_helper'

# Cannot include Devise TestHelpers

class ReservationTest < ActiveSupport::TestCase
	test "requires an email" do
		reservation = Reservation.new :email => nil, :reserve_on => 1.day.since
		assert !reservation.valid?
		assert_equal ["can't be blank"], reservation.errors[:email]

		reservation = Reservation.new :email => "test@test.com", :reserve_on => 1.day.since

		assert reservation.valid?
	end

	test "requires a reserve_on" do
		reservation = Reservation.new :email => "test@test.com", :reserve_on => nil
		assert !reservation.valid?

		reservation.reserve_on = 1.day.since
		assert reservation.valid?
	end


end