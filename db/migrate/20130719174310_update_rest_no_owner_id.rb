class UpdateRestNoOwnerId < ActiveRecord::Migration
  def change
  	# This didn't have the desired effect, or any real effect.
  	Restaurant.reset_column_information
  end
end
