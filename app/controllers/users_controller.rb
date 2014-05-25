class UsersController < ApplicationController
  def new
  	# When you create a fresh object, for example using the new method, that object does not belong to 
  	# the database yet. Once you call save upon that object it will be saved into the appropriate 
  	# database table. Active Record uses the new_record? instance method to determine whether an object 
  	# is already in the database or not.
  	@user = User.new
  end



  # Pretvoriti ovu metodu u web servis! html not allowed
  #def create
    #respond_to do |format|

      #format.json {
      	#@user = User.new(user_params)
        #@user.confirmation_code = SecureRandom.hex(20)
      	# Validations are typically run before commands are sent to the database. 
      	# If any validations fail, the object will be marked as invalid and Active Record will not perform 
      	# the INSERT or UPDATE operation. This avoids storing an invalid object in the database.

      	# The following methods trigger validations, and will save the object to the database only if the 
      	# object is valid: create, create!, save, save!, update, update!

      	# The bang versions (e.g. save!) raise an exception if the record is invalid. 
      	# The non-bang versions don't, save and update return false, create just returns the object.

      	#if verify_recaptcha(model: @user, message: "ERROR: You entered invalid code from the picture") && @user.save
          #UserMailer.signup_confirmation(@user).deliver
          #You are calling signup_confirmation kao da je class method a u maileru je definisana kao instance method
          # So what kind of magic is going on here ?
          # Pogledaj action mailer/base.rb (source code)
          #head :created
          #render text: "ok"
      	#else
      		#render "new"
          # You need to return errors in json format...
          #render json: @user.errors.messages

      	#end
      #}
      #format.html {
        #head :method_now_allowed
      #}
    #end
  #end

  def create
    respond_to do |format|
      format.json {
        @user = User.new(user_params)
        if @user.save
          render json: "ok"
        else
          render json: @user.errors.messages
        end
      }
    end
  end


  def confirmation
    user = User.find(params[:id])
    user.update_column(:confirmed, true) if user.confirmation_code == params[:code]

    redirect_to root_url, notice: "Successfully confirmed account!"
  end

  private

  # With user_params method we want to limit mass assigment only to:
  # email, password and password_confirmation

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
