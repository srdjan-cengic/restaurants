class Admin::UsersController < ApplicationController
	def index
		render text: "Ok, index action"
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admin_dashboard_path, notice: "Succesfully updated account"
		else
			redirect_to admin_dashboard_path, notice: "Not updated"
		end
	end

	private
	def user_params
  		params.require(:user).permit(:password, :password_confirmation)
  	end
end
