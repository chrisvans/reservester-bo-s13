class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

 
    create_table :categories_restaurants do |t|
      t.belongs_to :restaurants
      t.belongs_to :categories
    end


  end
end