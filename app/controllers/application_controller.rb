class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def require_login
    unless logged_in?
      flash[:errors] = ['Must be logged in']
      redirect_to new_session_url
    end
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    flash[:success] = 'Logged In Successfully'
    redirect_to user_url(user)
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end
end
