class Restaurant < ActiveRecord::Base

  belongs_to :owner
  has_many :reservations, :dependent => :destroy
  accepts_nested_attributes_for :reservations
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :menu
  validates_presence_of :name, :phone

  mount_uploader :photo, PhotoUploader

  mount_uploader :menu, MenuUploader

end
