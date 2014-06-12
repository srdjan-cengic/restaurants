class Api::UsersController < ApplicationController
  before_filter :user_params, only: [:create, :update]
  #respond_to in conjuction with respond_with
  respond_to :json

  def index
  end

  def show
  end

  def create
    #http://stackoverflow.com/questions/3290182/rest-http-status-codes?lq=1

    # If a resource has been created on the origin server, the response SHOULD be 201 (Created)
    # and contain an entity which describes the status of the request and refers to the new resource, 
    # and a Location header (see section 14.30).

    # 201 – Created, a new resource has been created. 
    # Location header contains the address of the new resource. 
    # Entity-body contains the representation of the new resource as it is on the server.

    # What status code should i send for requests failing validation or where a request is trying to add 
    # a duplicate in my database?
    # I recommend status code 422, "Unprocessable Entity".(11.9k)
    # 422 is used by an increasing number of APIs, and is even used by Rails out of the box.(1,316)
    @user = User.new(user_params)

    if @user.save
      respond_with @user, status: 201, location: api_user_url(@user)
    else
      @errors = @user.errors.full_messages # Array stringova
      render json: @errors, status: 422
    end
  end

 def update
    respond_to do |format|
      format.any(:json, :xml) {
        begin
            # something which might raise an exception
          @user = User.find(params[:id])
          @user.update(@permited)
        rescue ActiveRecord::RecordNotFound
            head :not_found
          return
        end

        head :no_content
          return
      }
    end
  end

  def destroy
  end

  private
  # With user_params method we want to limit mass assigment only to:
  # email, password and password_confirmation
  def user_params
    @permited = params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
