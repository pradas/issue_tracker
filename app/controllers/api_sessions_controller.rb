class ApiSessionsController < ApplicationController
   skip_before_filter :verify_authenticity_token  
  
  def login
    msg = { :status => 403, :message => "Invalid authentication"}
    format.json  { render :json => msg }
    
    # if (User.where(uid: params[:uid]).exists?)
    #   user = User.where(uid: params[:uid]).take
    #   user.api_token = ""
    #   session[:user_id] = user.id
      
    #   msg = { :status => "created", :message => "Success!", :id => user.id, :name => user.name, :api_token => user.api_token}
    #   format.json  { render :json => msg }
    # else
    #   msg = { :status => 403, :message => "Invalid authentication"}
    #   format.json  { render :json => msg }
    # end
  end
end
