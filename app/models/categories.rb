class Categories < ActiveRecord::Base
  attr_accessible :name

  belongs_to_and_has_many :restaurants
end
