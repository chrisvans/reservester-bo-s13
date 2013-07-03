class AddingAttributesToReservations < ActiveRecord::Migration
  def up
  	  add_column :reservations, :restaurant_id, :integer
      add_column :reservations, :r_time, :string
      add_column :reservations, :anon_name, :string
  end

  def down
  end
end
