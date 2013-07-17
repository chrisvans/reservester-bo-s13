class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone_number, :image, :menu, :category_tokens #, :owner
  # attr_accessible whitelists those things that can be mass assigned
  validates :address, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :phone_number, :presence => true
  validates :owner, :presence => true

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  belongs_to :owner
  has_many :reservations, :dependent => :destroy
  has_and_belongs_to_many :categories

  attr_reader :category_tokens

  def category_tokens=(ids)
    self.category_ids = ids.split(",")
  end
end
