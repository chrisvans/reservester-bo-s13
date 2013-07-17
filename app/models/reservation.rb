# == Schema Information
#
# Table name: reservations
#
#  id              :integer          not null, primary key
#  email           :text
#  message         :string(255)
#  booking_time    :datetime
#  restaurant_name :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  restaurant_id   :integer
#

class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :booking_time, :restaurant_id #used to be :restaurant_name

  belongs_to :restaurant

  validates :booking_time , :presence => true
  validates :email, :presence => true
end
