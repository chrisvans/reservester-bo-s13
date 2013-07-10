class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :datetime
      t.text :message
      t.references :restaurant

      t.timestamps
    end
    add_index :reservations, :restaurant_id
  end
end
