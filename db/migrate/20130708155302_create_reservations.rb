class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :requested_datetime
      t.text :short_message
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
