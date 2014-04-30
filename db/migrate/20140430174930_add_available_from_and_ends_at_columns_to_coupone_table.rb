class AddAvailableFromAndEndsAtColumnsToCouponeTable < ActiveRecord::Migration
  def change
  	add_column :coupones, :available_from, :datetime
  	add_column :coupones, :ends_at, :datetime
  end
end
