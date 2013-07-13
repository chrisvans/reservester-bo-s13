class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :owner, :google_id

  has_many :reservations
  belongs_to :owner

  validates :name, :owner, :presence => true

  mount_uploader :photo, PhotoUploader

  def pretty_string
    return "#{self.name} - #{self.address}"
  end


end
