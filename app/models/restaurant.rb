class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone_number

  validates :address, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :phone_number, :presence => true
end
