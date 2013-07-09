class AddingInputFieldsToReservations < ActiveRecord::Migration
	def change
	  add_column :reservations, :email, :string
	  add_column :reservations, :message, :string 
	  add_column :reservations, :restaurant_id, :integer
	  add_column :reservations, :taken, :boolean
	      
	end
end
