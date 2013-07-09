class TakingDownTheHouse < ActiveRecord::Migration
  def up
      remove_column :reservations, :r_time
      remove_column :reservations, :anon_name
      remove_column :reservations, :taken
      remove_column :reservations, :reserved_on	
      remove_column :reservations, :tables_taken
      remove_column :reservations, :tables_max
      remove_column :reservations, :is_master
      remove_column :reservations, :associated_day
      add_column :reservations, :email, :string
      add_column :reservations, :date_time, :datetime
      add_column :reservations, :message, :string
  end

  def down
  end
end
