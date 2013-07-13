class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :requested_date, :restaurant_id, :restaurant

  belongs_to :restaurant

  validate :email, :presence => true
  #validate :requested_date, :presence => true
end
