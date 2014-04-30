class Admin::UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def edit

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


	def destroy
	    @user.destroy
	    respond_to do |format|
	      format.html { redirect_to admin_users_url }
	      format.json { head :no_content }
	    end
	end

	private
	def user_params
  		params.require(:user).permit(:password, :password_confirmation)
  	end

  	def set_user
      @user = User.find(params[:id])
    end
end
