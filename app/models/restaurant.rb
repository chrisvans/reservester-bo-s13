class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url, :menu, :owner, :reservations

  belongs_to :owner
  has_many :reservations

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  validates :name, :owner, presence: true
  #validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :phone, presence: true

end
