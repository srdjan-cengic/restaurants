class Admin::UsersController < ApplicationController
	def index
		render text: "Ok, index action"
	end
	
	def update
		user = User.find(params[:id])

		if user.update(user_params)
			@user_updated = true
			@message = "Successfully updated admin password at: " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
		else
			@user_updated = false
			@message = "Passwords don't match or you entered less than 8 characters for password!"
		end

		respond_to do |format|
			format.js
		end
	end

	private
	def user_params
  		params.require(:user).permit(:password, :password_confirmation)
  	end
end
