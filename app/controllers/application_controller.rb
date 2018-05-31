class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.

# For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?

  def current_user
     (@current_user || User.find(session[:user_id]) if session[:user_id])

    # return the user if there is a user_id stored & backed by the browser in the session hash
    # if so then find the user in the db based on the user id
    # current_user if the current user already exist, if so return the previous current user
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
