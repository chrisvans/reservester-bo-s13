class CategoryRestaurant < ActiveRecord::Base
	belongs_to :restaurant

	belongs_to :category

	validates_presence_of :restaurant_id, :category_id

end
 

