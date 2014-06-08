class Api::SessionsController < ApplicationController
  def create
  	user = User.authenticate(params[:email], params[:password])

  	if user
  		session[:user_id] = user.id
  		user.update_column(:last_login, Time.now)
      
  		render json: user, status: 200
	  else
  		# "403: I know what you want, but I won't do that"
  		head :forbidden
	  end
  end

  def destroy
  end
end
