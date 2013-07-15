class Category < ActiveRecord::Base
  attr_accessible :name, :restaurant_id
  has_and_belongs_to_many :restaurants
  end
  
