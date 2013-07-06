class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone_number, :image, :menu

  validates :address, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :phone_number, :presence => true
  validates :owner, :presence => true

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  belongs_to :owner
end
