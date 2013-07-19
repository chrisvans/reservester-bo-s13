class AddingBooleanToReservation < ActiveRecord::Migration
  def up
  	add_column :reservations, :deleted, :boolean, :default => false
  	Reservation.reset_column_information
  	Reservation.update_all :deleted => false
  end

  def down
  	remove_column :reservations, :deleted
  end
end
