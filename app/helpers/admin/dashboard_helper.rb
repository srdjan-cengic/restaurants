module Admin::DashboardHelper
	def profile_link
		t(".current_user") + " " + current_user.email
	end
end
