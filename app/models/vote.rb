class Vote < ActiveRecord::Base

	belongs_to :restaurant, foreign_key: "restaurant_id"
	
	
end
