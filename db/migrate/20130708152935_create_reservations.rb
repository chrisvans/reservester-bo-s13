class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.string :name
    	t.string :email
    	t.datetime :requested_datetime
    	t.text :message
    	t.belongs_to :restaurant
    	t.timestamps
    end
  end
end
