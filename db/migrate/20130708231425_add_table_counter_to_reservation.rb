class AddTableCounterToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :tables_taken, :integer
    add_column :reservations, :tables_max, :integer
  end
end
