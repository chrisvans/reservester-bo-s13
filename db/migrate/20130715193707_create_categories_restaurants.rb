class CreateCategoriesRestaurants < ActiveRecord::Migration
  def self.up
  	create_table :categories_restaurants do |t|
  		t.integer :category_id
  		t.integer :restaurant_id
  	end

end

  def self.down
  

  	drop_table :categories_restaurants
  end
end
