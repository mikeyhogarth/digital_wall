class SessionsController < ApplicationController
  
  skip_before_filter :require_login
  
  def new
  end

  def create
    
    user = User.find_by_username(params[:username])
    
    if(user && user.authenticate(params[:password]))
      session[:user_id] = user.id
      redirect_to clients_url, :notice => "Logged in!"
    else
      flash[:notice] = "Incorrect login details"
      redirect_to log_in_path
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
