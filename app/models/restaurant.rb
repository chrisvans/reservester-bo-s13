class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone

  validates :address, :presence => true
  validates :description, :presence	=> true
  validates :name, :presence => true
  validates :phone, :presence => true,
                    :length => { :minimum => 5 }

end
