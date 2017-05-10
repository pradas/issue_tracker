class ApiUsersController < ApplicationController
  def index
    @users = User.all
    render status: :ok, file: "api/users/index.json.jbuilder"
  end
end
