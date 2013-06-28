class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image

  validates :address, :presence => true
  validates :description, :presence	=> true
  validates :name, :presence => true
  validates :phone, :presence => true,
                    :length => { :minimum => 5 }
  mount_uploader :image, ImageUploader 
end
