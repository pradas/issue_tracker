class ApiCommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create, :update, :destroy]
  
  def index
    if (Issue.where(id: params[:issue_id]).exists?)
      @comments = Comment.where(issue_id: params[:issue_id])
      render status: :ok, file: "api/comments/index.json.jbuilder"
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
end
