class SessionsController < ApplicationController
  def new; end

  def create
    session[:user_name] = params[:session][:name]
    flash[:notice] = 'Welcome to our application'
    redirect_to root_path
  end

  def destroy
    session[:user_name] = nil
    flash.now[:alert] = 'Bye bye!'
    redirect_to root_path
  end
end
