class DeleteDateTimeFromReservations < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :reservations, :date
  	remove_column :reservations, :time
  end
end
