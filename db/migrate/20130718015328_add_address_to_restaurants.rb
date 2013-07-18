class AddAddressToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :address2, :text
    add_column :restaurants, :city, :text
    add_column :restaurants, :state, :text
    add_column :restaurants, :zipcode, :text
  end
end
