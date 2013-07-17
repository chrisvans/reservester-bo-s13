class ChangeColumnName < ActiveRecord::Migration
  def up
  rename_column :reservations, :name, :guest_name
  add_column :reservations, :email, :string
  add_column :reservations, :message, :string 
  end

  def down
  end
end
