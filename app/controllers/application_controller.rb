class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :current_user_score
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token]) if session[:session_token]
  end

  def current_user_score
    @current_user_score ||= Score.find_by(name: current_user.name)
  end
end
