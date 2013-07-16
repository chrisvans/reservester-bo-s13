class PatchFixingMonkey < ActiveRecord::Migration
  def change
  	drop_table :categories
  	drop_table :categories_restaurants
  	create_table :categories do |t|
  		t.string :name

  		t.timestamps
  	end

  	create_table :categories_restaurants do |t|
  		t.belongs_to :restaurant
  		t.belongs_to :category
  	end

  end
end