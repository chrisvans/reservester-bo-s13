class Reservation < ActiveRecord::Base
  attr_accessible :r_time

  belongs_to :restaurant

end
