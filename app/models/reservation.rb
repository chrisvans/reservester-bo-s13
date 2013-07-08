class Reservation < ActiveRecord::Base
  attr_accessible :email, :date, :time, :restaurant_id, :comments

  belongs_to :restaurant

  validates :email, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :restaurant_id, presence: true

end
