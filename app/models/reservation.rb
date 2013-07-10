class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :datetime, :email, :message
  validates :datetime, presence: true
  validates :email, presence: true
end
