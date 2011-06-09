class SessionsController < ApplicationController
  def new
  end

def create1
  #raise request.env["omniauth.auth"].to_yaml
  auth = request.env["omniauth.auth"]
  authentication = Authentication.find_or_create_by_provider_and_uid( auth["provider"], auth["uid"])
  if authentication.user.nil?
    if false#TODO si current user entonces no creamos usuario, se lo asignamos al current_user
    else
      user = User.create(:name =>  auth["user_info"]["name"])
      authentication.user = user 
    end
  end
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"
end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end

