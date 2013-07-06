class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :guestname
      t.integer :guestnumber
      t.time :reservationtime
      t.date :reservationdate

      t.timestamps
    end
  end
end
