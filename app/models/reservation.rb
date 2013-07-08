class Reservation < ActiveRecord::Base
  attr_accessible :r_time, :anon_name

  belongs_to :restaurant

end
