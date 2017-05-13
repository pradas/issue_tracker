class ApiSessionsController < ApplicationController
   skip_before_filter :verify_authenticity_token  
  
  def login
    if (User.where(name: params[:name]).exists?)
      user = User.where(name: params[:name]).take
      msg = { :message => "Success!", :id => user.id, :name => user.name, :api_token => user.uid }
      render :json => msg, :status => 200
    else
      render :json => { :error => "Invalid authtentification." }, :status => 403
    end
  end
end
