class Restaurant < ActiveRecord::Base
  belongs_to :owner
  has_many :reservations
  has_and_belongs_to_many :categories

  attr_accessible :address, :description, :name, :phone, :image, :category_ids

  accepts_nested_attributes_for :reservations
  accepts_nested_attributes_for :categories

  validates :name, presence: true

  mount_uploader :image, ImageUploader

FactoryGirl.define do
  factory :restaurant do
    sequence(:name) do |n| 
      "J. Pace and Son Location ##{n}" 
    end
    association :owner
  end
end

end
