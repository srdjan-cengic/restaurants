class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  # helper_method
  # The method helper_method is to explicitly share some methods defined in the controller to make 
  # them available for the view. This is used for any method that you need to access from both controllers
  # and helpers/views. Standard helper methods are not available in controllers. 
  # Common use in application controller.
  helper_method :current_user

  private

  def current_user
  	# We will set curent user as an instance variable so it does some caching
  	#if session[:user_id]
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] #much better performance
    rescue ActiveRecord::RecordNotFound
  	#else
  		#nil
  	#end
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
    I18n.locale = params[:locale] if params[:locale].present?
  end

  # Second version is called several time per request
  # Every time this chunk of code will sent SQL query to the database to fetch user information
  # So we will cache user data in the instance variable
  # 5 Poziva <=> User.find(1), User.find(1), User.find(1), User.find(1), User.find(1)
  # <=> SELECT * FROM users WHERE user_id = 1 * 5
  # In another version, very important is ||(or) symbol which will only set instance variable, in
  # other word will only execute code on its right side(User.find(session[:user_id])) ako instanca varijabla
  # nije vec setovana.
  
  # Verzija koja svaki put vrsi SQL upit
  #def current_user 
  	#if session[:user_id]
  		#User.find(session[:user_id])
  	#end
  #end
end
