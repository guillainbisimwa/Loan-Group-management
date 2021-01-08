class SessionsController < ApplicationController
  #before_action :require_user

  def new
    redirect_to home_path if logged_in?
  end

  def signup
    redirect_to home_path if logged_in?
  end

  def register
    @user = User.new(user_params)
    if @user.save
      session[:user_name] = @user.name
      flash[:notice] = 'You are successfully registered'
      redirect_to home_path
    else
      flash[:alert] = 'Error occurs while saving user'
      redirect_to signup_path
    end
  end

  def create
    @user = User.find_by(name: params[:session][:name])

    redirect_to login_path, alert: 'User not found' if @user.nil?

    return if @user.nil?

    session[:user_name] = @user.name
    flash[:notice] = 'Welcome to our application'
    redirect_to home_path
  end

  def destroy
    session[:user_name] = nil
    flash.now[:alert] = 'Bye bye!'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:name)
  end
end
