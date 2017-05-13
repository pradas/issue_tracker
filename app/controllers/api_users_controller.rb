class ApiUsersController < ApplicationController
  before_action :authenticate, only: [:index2]
  
  def index
    @users = User.all
    render status: :ok, file: "api/users/index.json.jbuilder"
  end
end
