class Admin::BaseController < ApplicationController
	layout "admin"

	before_action :authenticate_user, :except=>[:new, :create]
	before_action :require_admin_user, :except=>[:new, :create]

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
