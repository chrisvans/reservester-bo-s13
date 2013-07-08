class DeleteTimeFromReservations < ActiveRecord::Migration
  def up
  	remove_column :reservations, :time
  	add_column :reservations, :time, :time
  end

  def down
  end
end
