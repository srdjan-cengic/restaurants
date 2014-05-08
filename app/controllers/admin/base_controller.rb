class Admin::BaseController < ApplicationController
	layout "admin"

	before_action :authenticate_user
	before_action :require_admin_user

	private
	def authenticate_user
		if !current_user
			redirect_to admin_url, notice: "You must be logged in as super admin to continue."
		end
	end

	def require_admin_user
		if current_user.role.name != "superadmin"
			redirect_to admin_url, notice: "You don't have access wrights."
		end
	end
end
