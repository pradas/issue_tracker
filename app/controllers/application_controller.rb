class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user

  def current_user
    if ( User.exists?(session[:user_id]))
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  
end