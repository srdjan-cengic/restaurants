class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.text :description
      t.string :telephone
      t.string :fb_url
      t.string :image
      t.integer :owner_id

      t.timestamps
    end
  end
end
