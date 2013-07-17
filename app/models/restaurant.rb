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
#  menu        :string(255)
#  owner_id    :integer
#

class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url, :menu, :owner, :reservations, :categories, :category_ids, :category_tokens
  attr_reader :category_tokens

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

  def category_tokens=(tokens)
  #  tokens = tokens.split(",").map(&:strip)
  #  categories = tokens.map { |token| Category.find_by_name(token) }
  #  if categories.any(&:nil?)
  #    raise ArgumentError, "'#{categories}' Contains an invalid category"
  #  else
  #    self.categories = categories
  #  end
    self.category_ids = tokens.split(",")
  end

end
