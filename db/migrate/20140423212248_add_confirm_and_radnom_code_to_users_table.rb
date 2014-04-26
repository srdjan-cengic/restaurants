class AddConfirmAndRadnomCodeToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :confirmation_code, :string, limit: 20
  	add_column :users, :confirmed, :boolean, default: false
  end
end
