class SessionsController < ApplicationController
    def new
      redirect_to root_path if logged_in?
    end
  
    def create
      @user = User.find_by(username: (params[:session][:name].downcase))
  
      redirect_to login_path, alert: 'There was something wrong with your login details' if @user.nil?
  
      return if @user.nil?
  
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully #{(@user.username).titlecase}"
      redirect_to root_path
    end
  
    def destroy
      session[:user_id] = nil
      flash.now[:alert] = 'Log out!'
      redirect_to root_path
    end
  end