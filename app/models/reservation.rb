class Reservation < ActiveRecord::Base
  attr_accessible :guest_name, :party_size, :time, :email, :phone_number, :message

  validates :email, presence: true #, email: true
  validates :party_size, presence: true

  belongs_to :restaurant

end
