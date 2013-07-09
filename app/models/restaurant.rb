class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache
  belongs_to :owner
  has_many :reservations, :dependent => :destroy
  mount_uploader :photo, PhotoUploader

  validates_presence_of :name
end