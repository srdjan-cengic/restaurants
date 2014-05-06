class Restaurant < ActiveRecord::Base
	belongs_to :user, foreign_key: "owner_id"
	has_many :coupones

	validates :name, presence: true, uniqueness: true

	def self.search(query)
 		where("name like ?", "%#{query}%")
	end
end
