class Reservation < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :restaurant

  validates :email, presence: true
  validates :date, presence: true
  validates :time, presence: true

end
