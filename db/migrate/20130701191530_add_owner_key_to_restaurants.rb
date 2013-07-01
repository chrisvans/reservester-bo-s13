class AddOwnerKeyToRestaurants < ActiveRecord::Migration
  def change
  	change_table(:restaurants) do |t|
  		t.belongs_to :owner_id
  	end
  end
end
