class Admin::SessionsController < Admin::BaseController
  def new
  end

  # method will handle admin authentication for now
  def create
  	user = User.authenticate(params[:email], params[:password])

  	if user
  		session[:user_id] = user.id

      user.update_column(:last_login, Time.now)
  		redirect_to admin_dashboard_url
  	else
  		# The flash is a special part of the session which is cleared with each request. 
  		# This means that values stored there will only be available in the next request, 
  		# which is useful for passing error messages etc.

  		#flash.now.alert = "Invalid email or password"
      flash[:error] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to admin_url
  end

end
