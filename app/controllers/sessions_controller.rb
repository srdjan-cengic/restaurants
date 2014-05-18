class SessionsController < ApplicationController
  def new
  end

  # method will handle admin authentication for now
  def create
  	user = User.authenticate(params[:email], params[:password])

  	if user
  		session[:user_id] = user.id

      user.update_column(:last_login, Time.now)
      respond_to do |format|
        format.html redirect_to admin_dashboard_url
        format.json { render json: { session: user.as_json(only: :email) }, status: :created }
      end
  		
  	else
  		# The flash is a special part of the session which is cleared with each request. 
  		# This means that values stored there will only be available in the next request, 
  		# which is useful for passing error messages etc.

  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to admin_url
  end

end
