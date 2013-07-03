class AddNameToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :name, :string, :null => false, :default => ""
  end
end
