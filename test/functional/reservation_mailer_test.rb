require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "reservation_notification" do
    date = 2.days.since

    reservation = FactoryGirl.create(:reservation, :reserve_on => date)
    restaurant  = reservation.restaurant
    owner       = restaurant.owner

    email = ReservationMailer.reservation_notification(reservation).deliver

    assert ActionMailer::Base.deliveries.present?
 
    assert_equal ['reservations@reservester.com'], email.from
    assert_equal [owner.email], email.to
    assert_equal "Reservation for #{restaurant.name}", email.subject
  end
end
