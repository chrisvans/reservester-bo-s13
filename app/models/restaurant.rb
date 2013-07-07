class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url, :menu, :owner

  belongs_to :owner

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  validates :name, :owner, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :phone, presence: true

end
