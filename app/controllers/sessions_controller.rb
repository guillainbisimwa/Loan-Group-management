class SessionsController < ApplicationController
  def new; end

  def signup; end

  def register
    session[:user_name] = params[:session][:name]
    flash[:notice] = 'You are successfully registered'
    redirect_to root_path
  end

  def create
    @user = User.find_by(name: params[:session][:name].downcase)

    redirect_to login_path, alert: 'User not found' if @user.nil?

    return if @user.nil?

    session[:user_id] = @user.id
    flash[:notice] = "Welcome to our application"
    redirect_to root_path
  end

  def destroy
    session[:user_name] = nil
    flash.now[:alert] = 'Bye bye!'
    redirect_to root_path
  end
end
