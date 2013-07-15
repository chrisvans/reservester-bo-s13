class CreateRestaurantsCategories < ActiveRecord::Migration
  def change
  	create_table :restaurants_categories, :id => false do |t|
    t.references :restaurant, :null => false
    t.references :category, :null => false

    t.timestamps
  end
  add_index :restaurants_categories, [:restaurant_id, :category_id], :unique => true
end
end

