class Restaurant < ActiveRecord::Base
	belongs_to :user, foreign_key: "owner_id"

	validates :name, presence: true, uniqueness: true
end
