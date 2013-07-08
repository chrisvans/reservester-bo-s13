class HelperAttributesForReservations < ActiveRecord::Migration
  def up
      add_column :reservations, :taken, :boolean
  end

  def down
  end
end
