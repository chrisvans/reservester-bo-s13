class AddAssociatedDayToReservationMaster < ActiveRecord::Migration
  def change
    add_column :reservations, :associated_day, :datetime
  end
end
