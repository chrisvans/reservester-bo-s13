class AddIndexToReservations < ActiveRecord::Migration
  def change
  	add_index :reservations, :restaurant_id 
  end
end
