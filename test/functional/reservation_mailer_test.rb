require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  # testing if the reservation mailer works

  # test "the reservation mailing works" do

  # 	#create a restaurant
  # 	restaurant = Restaurant.create(:name => "Taco Stand", :owner => "Marco Morawec")

  # 	#creating an owner with an email
  # 	owner = Owner.create(:name => "Marco Morawec", :email => "marco@gmail.com")

  # 	#assining an owner to the restaurant.
  # 	owner.restaurants << restaurant

  # 	#create a reservation and 
  # 	reservation = Reservation.create(:guestname => "John", :guestemail => "marco.morawec@gmail.com", 
  # 										:reserve_on => "2013-07-15 17:00:06")
  # 	#assign it ot a restaurant
  # 	restaurant.reservations << reservation

  # 	#test if the email get's send
  # 	assert ReservationMailer.reservation_notification(@reservation).deliver

  # end


end
