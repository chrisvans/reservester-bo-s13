class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :owner

  validates :address, :presence => true
  validates :description, :presence	=> true
  validates :name, :owner, :presence => true
  validates :phone, :presence => true,
                    :length => { :minimum => 5 }
  mount_uploader :image, ImageUploader 

  belongs_to :owner
  
end
