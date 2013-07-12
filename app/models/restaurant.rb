class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :owner

  #validates :address, :presence => true
  #validates :description, :presence	=> true
  validates :name, :owner, :presence => true
  #validates :phone, :presence => true, :length => { :minimum => 5 }
  #validates :phone, :phone_number => {:format => /\d{3}-\d{3}-\d{4}/}
  
  mount_uploader :image, ImageUploader 
  
  has_many :reservations
  belongs_to :owner
  
end
