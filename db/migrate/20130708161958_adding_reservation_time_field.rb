class AddingReservationTimeField < ActiveRecord::Migration
  def change
	  add_column :reservations, :booking, :string
  end
end
