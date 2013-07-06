class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :owner, :google_id

  has_many :reservations
  belongs_to :owner

  validates :name, :owner, :presence => true

  mount_uploader :photo, PhotoUploader


  def google_place
    if self.google_id.blank?
      nil
    else
      @google_place ||= Google::Place.find(self.google_id)
    end
  end
end
