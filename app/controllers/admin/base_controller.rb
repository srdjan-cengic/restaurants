class Admin::BaseController < ApplicationController
	layout "admin"

	before_action :require_admin_user

	def require_admin_user
		puts current_user.role
	end
end
