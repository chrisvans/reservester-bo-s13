class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :requested_date, :restaurant_id

  belongs_to :restaurant

  validate :email, :requested_date, :presence => true
end
