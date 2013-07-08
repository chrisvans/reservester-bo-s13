class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.text :email
      t.string :message
      t.datetime :booking_time
      t.string :restaurant_name

      t.timestamps
    end
  end
end
