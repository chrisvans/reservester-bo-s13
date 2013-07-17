class CreateCategoryRestaurantRelationship < ActiveRecord::Migration
  def change
    create_table :categories_restaurants, id: false do |t|
    	t.belongs_to :category_id
    	t.belongs_to :restaurant_id
    end
  end
end
