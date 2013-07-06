class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :guestname
      t.string :guestemail
      t.integer :guestnumber
      t.string :message
      t.datetime :reserve_on
      t.time :reservationtime
      t.date :reservationdate
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
