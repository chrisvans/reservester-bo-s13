# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  address     :text
#  phone       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  owner_id    :integer
#  menu        :string(255)
#

class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :owner, :menu, :category_ids

  validates :name, :owner, :presence => true

  mount_uploader :image, ImageUploader 
  mount_uploader :menu, MenuUploader
  
  has_many :reservations
  has_and_belongs_to_many :categories
  belongs_to :owner
  accepts_nested_attributes_for :categories
  
end
