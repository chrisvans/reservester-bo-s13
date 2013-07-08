class Reservation < ActiveRecord::Base
  attr_accessible :name, :email, :requested_datetime, :message, :restaurant

  belongs_to :restaurant

  validates :email, presence: true
  validates :requested_datetime, presence: true

end
