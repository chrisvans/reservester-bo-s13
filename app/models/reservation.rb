class Reservation < ActiveRecord::Base
  attr_accessible :r_time, :anon_name, :reserved_on, :tables_taken, :tables_max

  belongs_to :restaurant

end
