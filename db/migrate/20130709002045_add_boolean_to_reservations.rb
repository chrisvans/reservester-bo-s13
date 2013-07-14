class AddBooleanToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :is_master, :boolean
  end
end
