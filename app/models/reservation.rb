class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :datetime, :email, :message
end
