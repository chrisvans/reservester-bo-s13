class Restaurant < ActiveRecord::Base
  belongs_to :owner
  has_many :reservations

  attr_accessible :address, :description, :name, :phone, :image

  accepts_nested_attributes_for :reservations
  
  validates :name, presence: true

  mount_uploader :image, ImageUploader

end
