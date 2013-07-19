class Category < ActiveRecord::Base
  has_and_belongs_to_many :restaurants
  attr_accessible :name, :restaurant_id, :category_id
end