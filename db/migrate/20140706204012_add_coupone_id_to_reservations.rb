class AddCouponeIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :coupone_id, :integer
  end
end
