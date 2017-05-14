class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user


  def authenticate
    if request.headers['Authorization'].present?
      if (User.where(uid: request.headers['Authorization']).exists?)
        @current_user = User.where(uid: request.headers['Authorization']).take
      else
        render json: { error: "your token is invalid" }, status: :unauthorized
      end
    else 
      render json: { token: "missing token" }, status: :unauthorized
    end 
  end


  def current_user
    if ( User.exists?(session[:user_id]))
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  
end