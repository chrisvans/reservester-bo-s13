class CreateCategories < ActiveRecord::Migration
  def change
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
