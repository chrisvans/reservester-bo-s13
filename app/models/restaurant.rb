class Restaurant < ActiveRecord::Base
  attr_accessible :category_ids, :address, :description, :name, :phone, :photo, :photo_cache, :pdf, :longitude, :latitude, :restaurant_id

  mount_uploader :photo, PhotoUploader
  mount_uploader :pdf, PdfUploader

  geocoded_by :address
  after_validation :geocode

  # validates :address, presence: true
  # validates :description, presence: true
  # validates :phone, presence: true
  # validates :photo, presence: true
  # validates :photo_cache, presence: true
  
  belongs_to :owner
  has_many :reservations, :dependent => :destroy
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :reservations, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  validates_presence_of :name

end
