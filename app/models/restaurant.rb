class Restaurant < ActiveRecord::Base
  attr_accessible :address, :city, :description, :name, :phone_number, :state, :zip_code, :image, :pdf_menu
	validates :name, presence: true
	validates :owner_id, presence: true
  mount_uploader :image, ImageUploader
  mount_uploader :pdf_menu, PdfMenuUploader
  belongs_to :owner
  has_many :reservations
  accepts_nested_attributes_for :reservations

end
