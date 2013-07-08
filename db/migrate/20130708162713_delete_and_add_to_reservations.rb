class DeleteAndAddToReservations < ActiveRecord::Migration
  def down
  	remove_column :reservations, :date
  	remove_column :reservations, :time
  end


  def up
  end


end
