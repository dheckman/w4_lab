class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user, :logged_in?

private
def current_user
  @current_user ||= User.find_by(id: session[:current_user_id])
end

def logged_in?
  current_user
end

def authenticate
  current_user_id = session[:current_user_id]
  unless current_user_id
    redirect_to new_logins_path, notice: "YA GOTTA BE LOGGED IN, EH?"
  end
end
end
