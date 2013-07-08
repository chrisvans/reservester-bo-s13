class DeleteDateFromReservations < ActiveRecord::Migration
  def up
  	remove_column :reservations, :date
  	remove_column :reservations, :time
  	add_column :reservations, :date, :date
  	add_column :reservations, :time, :date
  end

  def down
  end
end
