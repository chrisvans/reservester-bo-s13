class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def res(user, restaurant, reservation)
    @user = user
    @restaurant = restaurant
    @reservation = reservation
    @url  = 'localhost:3000'
    mail(to: @user.email, subject: 'Reservation Made')
  end

end
