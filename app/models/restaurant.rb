class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url, :menu, :owner, :reservations, :categories, :category_ids

  belongs_to :owner
  has_many :reservations
  has_and_belongs_to_many :categories

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  validates :name, :owner, presence: true
  #validates :description, presence: true, length: { minimum: 6 }
  validates :address, presence: true
  validates :phone, presence: true

  def pretty_string
    return "#{self.name} - #{self.address}"
  end

end
