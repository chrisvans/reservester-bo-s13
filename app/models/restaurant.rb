class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :pdf
  mount_uploader :photo, PhotoUploader
  mount_uploader :pdf, PdfUploader

  # validates :address, presence: true
  # validates :description, presence: true
  # validates :phone, presence: true
  # validates :photo, presence: true
  # validates :photo_cache, presence: true

end
