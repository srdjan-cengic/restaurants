class Admin::UsersController < Admin::BaseController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		respond_to do |format|
	      format.html
	      format.js
	    end
	end

	def create
		@user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to admin_users_path(@user), notice: 'User was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @user }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def new
    	@user = User.new
 	 end

	def edit
		respond_to do |format|
	      format.html
	      format.js
	    end
	end
	
	def update
		user = User.find(params[:id])

		if user.update(user_params)
			@user_updated = true
			@message = "Successfully updated admin at: " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
		else
			@user_updated = false
			@message = "Passwords don't match or you entered less than 8 characters for password!"
		end

		respond_to do |format|
			format.html { redirect_to admin_users_path(@user), notice: 'User was successfully updated.' }
			format.js
		end
	end

	def update_user
		respond_to do |format|
			if !user.password.blank and !user.password_confirmation.blank
				@updated_user = true
				@messages_user = "Successfully updated at: " + Time.now.strftime("%d/%m/%Y %H:%M:%S")
			else
				@updated_user = false
				@messages_user = "Update was not successfull"
			end
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
  		params.require(:user).permit(:password, :password_confirmation, :name, :username, :email)
  	end

  	def set_user
      @user = User.find(params[:id])
    end
end
