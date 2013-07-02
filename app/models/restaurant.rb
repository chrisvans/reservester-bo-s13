class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url, :menu

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :phone, presence: true
end
