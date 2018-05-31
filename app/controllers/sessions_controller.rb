class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)

    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id #setting the sessions hash user_id, which is backed by user browser
      flash[:success] = "You have sucessfully logged In"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] =  "You have logged out"
    redirect_to root_path
  end
end