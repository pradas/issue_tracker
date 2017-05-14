class ApiUsersController < ApplicationController
  
  def index
    @users = User.all
    render status: :ok, file: "api/users/index.json.jbuilder"
  end
  
  def show
    if User.where(id: params[:user_id]).exists?
      @user = User.find(params[:user_id])
      render status: :ok, file: "api/users/show.json.jbuilder"
    else
      render :json => { :error => "User not found." }, :status => 404
    end
  end
end
