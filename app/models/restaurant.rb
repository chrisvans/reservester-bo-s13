class Restaurant < ActiveRecord::Base
  belongs_to :owner

  attr_accessible :address, :description, :name, :phone, :image

  validates :name, presence: true

  mount_uploader :image, ImageUploader

end
