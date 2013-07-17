class CreateCategoriesRestaurantsTable < ActiveRecord::Migration
  def up
  	create_table :categories_restaurants, :id => false do |t|
      t.integer :category_id
      t.integer :restaurant_id
  	end
  	add_index :categories_restaurants, [:category_id, :restaurant_id], :unique => true
  end

  def down
  end
end
