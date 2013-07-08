require 'test_helper'

class ReservationTest < ActiveSupport::TestCase


	test "that validation work" do
		reservation = Reservation.new(:guestname => nil, :guestemail => nil, :reserve_on => nil)
		assert reservation.valid? == false
		assert reservation.errors.messages[:guestname] == ["can't be blank"]
		assert reservation.errors.messages[:guestemail] == ["can't be blank"]
		assert reservation.errors.messages[:reserve_on] == ["can't be blank"]
	end




  # test "the truth" do
  #   assert true
  # end
end
