require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  should belong_to(:restaurant)

  should validate_presence_of(:reserve_on)
  should allow_value(Time.now + 1 .day).for(:reserve_on)
  should validate_presence_of(:email)
  should allow_value("testman@gmail.com").for(:email)
  should_not allow_value("test").for(:email)
  should_not allow_value("test@").for(:email)
  should_not allow_value("test@foo").for(:email)


  test "validate when you create a reservation it must be in the future" do
    current_time = Time.parse("7/4/2013 12:00:00 UTC")
    before_time  = Time.parse("7/3/2013 12:00:00 UTC")
    after_time   = Time.parse("7/5/2013 12:00:00 UTC")

    Timecop.freeze(current_time) do
      reservation = FactoryGirl.build(:reservation, :reserve_on => before_time)
      assert ! reservation.save
      assert_equal ["must be in the future"], reservation.errors[:reserve_on]
      reservation.reserve_on = after_time
      assert reservation.save
    end
  end


end
