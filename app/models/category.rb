class Category < ActiveRecord::Base
  attr_accessible :name, :restaurants

  has_and_belongs_to_many :restaurants
end
