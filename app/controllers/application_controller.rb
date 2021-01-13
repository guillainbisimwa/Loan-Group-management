class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(name: session[:user_name]) if session[:user_name]
  end

  def logged_in?
    return false if current_user.nil?

    true
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in!'
    redirect_to login_path
  end
end
