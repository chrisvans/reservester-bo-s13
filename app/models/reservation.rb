class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :booking
  belongs_to :restaurant

  validates_presence_of :booking, :email
end
