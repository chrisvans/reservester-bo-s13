class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :phone, presence: true
end
