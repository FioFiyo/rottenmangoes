class ApplicationController < ActionController::Base
 #all your controllers inherit from this.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end
  
  #uses an if and an assignment which 
  #finds session id for that user and assigns it to 
  #current user if current user doesn't exist
  #checking then if the user has logged in
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #increases the scope for your app.
  helper_method :current_user
end
