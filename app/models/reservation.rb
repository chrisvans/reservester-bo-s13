class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :reserve_on, :restaurant_id, :restaurant

  belongs_to :restaurant

  validates :reserve_on, :presence => true
  validates :email, :presence => true, :email => true
end
