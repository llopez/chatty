class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You are logged in'
      redirect_to root_path
    else
      flash[:error] = 'Email or password invalid'
      redirect_to new_sessions_path
    end
  end

  def destroy
    flash[:notice] = 'You are logged out'
    session[:user_id] = nil
    redirect_to new_sessions_path
  end
end
