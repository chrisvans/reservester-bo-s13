class AddMenueToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :menue, :string
  end
end
