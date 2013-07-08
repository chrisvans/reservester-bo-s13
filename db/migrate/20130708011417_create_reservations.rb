class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :requested_date
      t.string :message
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
