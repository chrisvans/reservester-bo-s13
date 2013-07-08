class AddDatetimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :reserved_on, :datetime
  end
end
