class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :date_time, :deleted

  default_scope where(:deleted => false)

  validates_presence_of :email, :date_time

  belongs_to :restaurant

end
