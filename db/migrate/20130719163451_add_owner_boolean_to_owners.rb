class AddOwnerBooleanToOwners < ActiveRecord::Migration
  def up
    add_column :owners, :is_owner, :boolean, :default => false
  	Owner.reset_column_information
  	Owner.update_all :is_owner => true
  end

  def down
  	remove_column :owners, :is_owner
  end
  
end
