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
end
