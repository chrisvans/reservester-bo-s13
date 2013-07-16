class CreateCategories < ActiveRecord::Migration
  def change
  	drop_table :categories
  	drop_table :categories_restaurants
  	create_table :categories do |t|
  		t.string :name

  		t.timestamps
  	end

  	create_table :categories_restaurants do |t|
  		t.belongs_to :restaurants
  		t.belongs_to :categories
  	end

  	# add_index :categories_restaurants, [:restaurants_id]
  	# add_index :categories_restaurants, [:categories_id]
  end
end