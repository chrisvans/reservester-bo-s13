# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  email          :string(255)
#  requested_date :datetime
#  message        :string(255)
#  restaurant_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :requested_date, :restaurant_id, :restaurant

  belongs_to :restaurant

  validate :email, :presence => true
  #validate :requested_date, :presence => true
end
