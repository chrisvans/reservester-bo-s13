class RemoveIndexesFromCategoryRestaurantRelationship < ActiveRecord::Migration
  def change
    drop_table :categories_restaurants
  end 
end
