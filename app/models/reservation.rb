class Reservation < ActiveRecord::Base
  attr_accessible :r_time, :anon_name, :reserved_on

  belongs_to :restaurant

end
