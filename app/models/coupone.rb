class Coupone < ActiveRecord::Base
	belongs_to :restaurant
	has_many :reservations, foreign_key: "coupone_id"
end
