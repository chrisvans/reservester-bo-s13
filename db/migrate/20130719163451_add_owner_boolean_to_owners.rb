class AddOwnerBooleanToOwners < ActiveRecord::Migration
  def up
    add_column :owners, :is_owner, :boolean, :default => false
  end

  def down
  	remove_column :owners, :is_owner
  end
  
end
