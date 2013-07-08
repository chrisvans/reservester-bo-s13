class MakeOwnerIdRequired < ActiveRecord::Migration
  def change
  	change_column :owners, :id, :primary_key
  end

end
