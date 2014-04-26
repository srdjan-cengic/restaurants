class ChangeLimitOfConfirmationCodeUsersTable < ActiveRecord::Migration
  def change
  	change_column :users, :confirmation_code, :string, :limit => 255
  end
end
