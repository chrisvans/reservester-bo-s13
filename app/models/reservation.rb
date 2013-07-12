class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :datetime, :email, :message, :restaurant, :restaurant_id
  validates :datetime, presence: true
  validates :email, presence: true
end
