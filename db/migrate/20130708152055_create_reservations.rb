class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.string :email
    	t.string :date
    	t.string :time
    	t.text :message
    	t.integer :restaurant_id
      	t.timestamps
    end
  end
end
