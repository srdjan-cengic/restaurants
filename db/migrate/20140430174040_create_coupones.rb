class CreateCoupones < ActiveRecord::Migration
  def change
    create_table :coupones do |t|
      t.string :description
      t.integer :number_of_available
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
