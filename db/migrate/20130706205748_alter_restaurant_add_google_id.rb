class AlterRestaurantAddGoogleId < ActiveRecord::Migration
  def up
    add_column :restaurants, :google_id, :string
    add_index  :restaurants, :google_id
  end

  def down
    remove_index  :restaurants, :google_id
    remove_column :restaurants, :google_id
  end
end
