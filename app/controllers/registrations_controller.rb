class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      flash[:notice] = 'You have successfully signed up'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
