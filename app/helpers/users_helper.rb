module UsersHelper

	def unconfirmed_users(total, confirmed)
		total-confirmed
	end
end
